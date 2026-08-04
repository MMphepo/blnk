#!/bin/sh

echo "Running Blnk database migrations..."

blnk migrate

echo "Starting Blnk server..."

exec blnk start