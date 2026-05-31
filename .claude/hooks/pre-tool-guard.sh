#!/bin/bash
JQ="/c/Users/USER/AppData/Local/Microsoft/WinGet/Packages/jqlang.jq_Microsoft.Winget.Source_8wekyb3d8bbwe/jq.exe"
INPUT=$(cat)
CMD=$(echo "$INPUT" | "$JQ" -r '.command // empty')

if echo "$CMD" | grep -qE "terraform destroy|terraform apply.*-auto-approve|aws s3 rm|aws s3 rb"; then
  echo '{"decision": "block", "reason": "Destructive command blocked by DO hook. Use /tf-destroy for safe teardown."}'
  exit 2
fi

exit 0
