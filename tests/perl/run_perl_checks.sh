#!/usr/bin/env bash
set -euo pipefail

perl -c scripts/match.pl
perl -c scripts/annotate.pl
