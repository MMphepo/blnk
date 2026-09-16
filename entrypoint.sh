#!/bin/sh

echo "Running Blnk database migrations..."

blnk migrate up

echo "Starting Blnk server..."

exec blnk start