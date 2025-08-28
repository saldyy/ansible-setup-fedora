
### Configurations files for Fedora Sway spin

#### Dependencies

- Ansible
- Git ssh keys in `~/.ssh`

#### Setting up

Run commands

```
ansible-playbook main.yml --extra-vars "@vars/main.yml"
./sync.sh config
```
