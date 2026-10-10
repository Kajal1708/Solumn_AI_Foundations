#!/bin/bash
set -euo pipefail
INPUT_PATH="/workspace/input.txt"
if [ ! -f "$INPUT_PATH" ]; then
  INPUT_PATH="/tmp/harbor-workspace/input.txt"
fi
if [ ! -f "$INPUT_PATH" ]; then
  echo "missing input file" >&2
  exit 1
fi
python3 - <<'PY'
import json
from pathlib import Path

input_path = Path('/workspace/input.txt')
if not input_path.exists():
    input_path = Path('/tmp/harbor-workspace/input.txt')
if not input_path.exists():
    raise FileNotFoundError('missing input file')

text = input_path.read_text()
words = text.split()
unique = sorted({w.lower() for w in words})
report = {
    'word_count': len(words),
    'unique_words': len(unique),
    'checksum': sum(sum(ord(ch) for ch in w) for w in unique) % 1000,
    'status': 'ok'
}
Path('/tmp/report.json').write_text(json.dumps(report, indent=2) + '\n')
PY
