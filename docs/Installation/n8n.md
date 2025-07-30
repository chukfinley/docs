# n8n

## n8n Credentials Export Guide

### Exporting Credentials from Docker Container

To export credentials from an n8n instance running in Docker:

```bash
# 1. Export credentials in decrypted format
docker exec -u node -it [CONTAINER_ID] n8n export:credentials --all --decrypted --output=credentials.json

# 2. Copy the credentials file to your local machine
docker exec -it [CONTAINER_ID] cat credentials.json > ./credentials.json
```

Replace `[CONTAINER_ID]` with your actual n8n container ID.

**Note:** When using `--decrypted` flag during export, the credentials will be stored in plain text. Handle the file securely and delete it after import.