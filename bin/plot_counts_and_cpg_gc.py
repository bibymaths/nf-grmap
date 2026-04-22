#!/usr/bin/env python3
import argparse
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import MaxNLocator
from matplotlib.patches import Patch


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--input', required=True)
    ap.add_argument('--gene-counts', required=True)
    ap.add_argument('--gene-cpg-gc', required=True)
    args = ap.parse_args()

    df = pd.read_csv(args.input, sep='\t', header=None, names=['gene_type', 'gene_id', 'cpg_gc_content', 'count'])

    types = df['gene_type'].unique()
    cmap = plt.get_cmap('tab10')
    color_map = {t: cmap(i % cmap.N) for i, t in enumerate(types)}
    df = df.sort_values(by='count', ascending=False)
    bar_colors = df['gene_type'].map(color_map)

    fig, ax = plt.subplots(figsize=(16, 8))
    ax.bar(df['gene_id'], df['count'], color=bar_colors)
    ax.set_xlabel('Gene', fontsize=10)
    ax.set_ylabel('Count', fontsize=10)

    if df.shape[0] < 50:
        ax.tick_params(axis='x', labelrotation=45, labelsize=8)
        plt.setp(ax.get_xticklabels(), ha='right')
    else:
        ax.tick_params(axis='x', labelbottom=False)

    ax.tick_params(axis='y', labelsize=6)
    ax.yaxis.set_major_locator(MaxNLocator(integer=True))

    handles = [Patch(color=color_map[t], label=t) for t in types]
    ax.legend(handles=handles, title='Type', fontsize=6, title_fontsize=10, frameon=True, loc='best')
    plt.tight_layout()
    fig.savefig(args.gene_counts, dpi=300)
    plt.close(fig)

    nz = df[df['cpg_gc_content'] != 0]
    if not nz.empty:
        fig2, ax2 = plt.subplots(figsize=(8, 8))
        bar_colors2 = nz['gene_type'].map(color_map)
        ax2.bar(nz['gene_id'], nz['cpg_gc_content'], color=bar_colors2)
        ax2.set_xlabel('Gene', fontsize=10)
        ax2.set_ylabel('CpG GC Content (%)', fontsize=10)
        ax2.tick_params(axis='x', labelrotation=45, labelsize=8)
        ax2.tick_params(axis='y', labelsize=6)
        ax2.legend(handles=handles, title='Type', fontsize=6, title_fontsize=10, frameon=True, loc='best')
        plt.tight_layout()
        fig2.savefig(args.gene_cpg_gc, dpi=300)
        plt.close(fig2)
    else:
        with open(args.gene_cpg_gc, 'w', encoding='utf-8') as fh:
            fh.write('# No data available for CpG GC content\n')


if __name__ == '__main__':
    main()
