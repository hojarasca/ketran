# Como crear el kube cluster.

1. Create infraestructure:
  - `./actions/deploy-all.yml`
2. Copy the internal certificate to the bastion server.
  - `scp ./route/to/ketran-internal.pem ubuntu@bastion_ip:.ssh/id_rsa`
  - `ssh ubuntu@bastion_ip`
  - `chmod 600 .ssh/id_rsa`
3. From bastion enter into the master node and init the cluster:
  - `ssh ubuntu@master_ip`
  - `sudo kubeadm init --pod-network-cidr=10.244.0.0/16`
  - Config `kubectl` with the given commands
  - Save the command to join nodes.
4. Install flannel:
  - `sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml`
5. From bastion ssh into the worker nodes and execute the join command.
6. Ready to go :)
