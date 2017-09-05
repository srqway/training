# Practical PostgreSQL Backup & Restore

Practical PostgreSQL backup & restore using the core tools and pgBackRest.

# Build the VM

1) Clone the training repository into a local directory using git:
```
git clone git@github.com:pgbackrest/training.git
```

2) Build the Vagrant VM:
```
cd training
vagrant up
```

# Build the Documentation

1) Logon to the Vagrant VM:
```
vagrant ssh
```

2) Build the documentation:
```
/docdynamo/doc/doc.pl --no-cache --doc-path=/training/doc
```

3) Check that `training/backup-training.html` was created.
