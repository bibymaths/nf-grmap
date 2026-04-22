#!/usr/bin/env python3
import argparse
import pandas as pd
import matplotlib.pyplot as plt


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--input', required=True)
    ap.add_argument('--output', required=True)
    args = ap.parse_args()

    df = pd.read_csv(args.input, sep='\t', comment='#', header=0)
    df = df[(df['TSS_Distance'] != 'N/A') & (df['TSS_Gene_Type'] != 'N/A')]
    df['TSS_Distance'] = pd.to_numeric(df['TSS_Distance'])
    df = df[df['TSS_Distance'] <= 10000]

    plt.figure(figsize=(10, 10))
    gene_types = df['TSS_Gene_Type'].unique()
    cmap = plt.get_cmap('tab10')
    color_map = {gt: cmap(i % cmap.N) for i, gt in enumerate(gene_types)}

    for gt in gene_types:
        subset = df[df['TSS_Gene_Type'] == gt]
        plt.hist(subset['TSS_Distance'], bins=50, alpha=0.6, label=gt, color=color_map[gt], edgecolor='black')

    plt.xlabel('Distance (bp)', fontsize=10)
    plt.ylabel('Number of Matches', fontsize=10)
    plt.title('Proximity of Matches to TSS', fontsize=12)
    plt.grid(axis='y', linestyle=':', alpha=0.2)
    plt.legend(title='Type', fontsize=8, title_fontsize=10)
    plt.tight_layout()
    plt.savefig(args.output, dpi=300)
    plt.close()


if __name__ == '__main__':
    main()
