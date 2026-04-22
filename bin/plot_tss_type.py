#!/usr/bin/env python3
import argparse
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


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
    sns.boxplot(data=df, x='TSS_Gene_Type', y='TSS_Distance', hue='TSS_Gene_Type', palette='tab10', legend=False)
    plt.xticks(rotation=45)
    plt.ylabel('Distance (bp)')
    plt.xlabel('Type')
    plt.title('Transcription Start Site Distances', fontsize=12)
    plt.tight_layout()
    plt.savefig(args.output, dpi=300)
    plt.close()


if __name__ == '__main__':
    main()
