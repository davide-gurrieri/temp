from os import getenv
from huggingface_hub import snapshot_download


if __name__ == "__main__":
    env=getenv("OUTPUT_MODEL")
    repo_id = "gurro/nano-mistral_bitsandbytes_int4"
    # Download the repository snapshot
    snapshot_download(repo_id, local_dir=f"{env}/")
