gpg --full-gen-key

gpg --list-secret-keys
gpg --list-keys

gpg --delete-secret-keys "John Doe"
gpg --delete-keys "John Doe"

gpg -a --export-secret-keys > secret.key
gpg -a --export > public.key

gpg --import public.key
gpg --import secret.key

gpg -a -r "John Doe" --encrypt foo.txt
