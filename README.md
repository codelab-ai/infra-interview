## Adding a user to git-crypt

- Setup `git-crypt` with GPG key
- Add GPG public key (by sending to admin) in order to gain access

### For admin

- Import new key into local trust store:

```
$ gpg --import /path/to/key.pub
```

- Get the key ID and trust it

```
$ gpg --list-keys
$ gpg --edit-key <key_id> (At the gpg> prompt, type trust, then type 5 for ultimate trust, then y to confirm, then quit.)
```

- Push the changes, get PR merged

## Run Terraform

Secrets will be kept in `secrets.tf` file in encrypted format, need to unlock it before running Terraform:

```
$ git-crypt unlock
$ cd terraform/environments/staging
$ terraform plan
$ terraform apply
```
