#!/usr/bin/env bash
set -euo pipefail

uv venv
source .venv/bin/activate
uv sync

if [ ! -x ".perl5/bin/cpanm" ]; then
  curl -L https://cpanmin.us | perl - --local-lib-contained .perl5 App::cpanminus
fi

.perl5/bin/cpanm --local-lib-contained .perl5 Parallel::ForkManager

echo
echo "Activate with:"
echo "source .venv/bin/activate"
echo "export PERL5LIB=\"$PWD/.perl5/lib/perl5:\$PERL5LIB\""
echo "export PATH=\"$PWD/.perl5/bin:\$PATH\""