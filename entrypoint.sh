#!/bin/sh

set -e

echo "Running Blnk database migrations..."

blnk migrate up

echo "Blnk migrations completed successfully."

echo "Starting Blnk..."

exec blnk start