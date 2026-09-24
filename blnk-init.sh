#!/bin/sh

# Copyright 2024 Blnk Finance Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eu

CONFIG_DIR="${BLNK_CONFIG_DIR:-/workspace}"
CONFIG_FILE="${CONFIG_DIR}/blnk.json"

POSTGRES_USER="${POSTGRES_USER:-postgres}"
POSTGRES_PASSWORD="${POSTGRES_PASSWORD:-password}"
POSTGRES_DB="${POSTGRES_DB:-blnk}"

mkdir -p "${CONFIG_DIR}"

if [ -f "${CONFIG_FILE}" ]; then
    echo "Blnk configuration already exists at ${CONFIG_FILE}"
    exit 0
fi

if [ -d "${CONFIG_FILE}" ]; then
    echo "Removing invalid blnk.json directory..."
    rm -rf "${CONFIG_FILE}"
fi

cat > "${CONFIG_FILE}" <<EOF
{
  "project_name": "Blnk",
  "data_source": {
    "dns": "postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${POSTGRES_DB}?sslmode=disable"
  },
  "redis": {
    "dns": "redis:6379"
  },
  "server": {
    "port": "5001"
  }
}
EOF

echo "Created ${CONFIG_FILE}"
echo "Blnk configuration:"
cat "${CONFIG_FILE}"