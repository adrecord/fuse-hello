# fuse-hello
A simple Docker FUSE test container (originally from https://github.com/rustyx/fuse-hello)


# Building

1. Build the fuse adapter container

```
$ podman build -t docker.io/adrec/fuse-hello:latest .
```

2. Push the container to a registry

```
$ podman push docker.io/adrec/fuse-hello:latest
```


# Running

# Running with podman

1. Run the pod with podman

```
$ podman kube play fuse-hello.yaml
```

2. Verify the container creating the fuse adapter is able to use it

```
$ podman logs fuse-hello-pod-adapter
Hello World!
Hello World!
Hello World!
```

3. Verify the other container only using the fuse adapter is able to use it.

```
$ podman logs fuse-hello-pod-user
Hello World!
Hello World!
Hello World!
```

4. Stop the pod

```
$ podman kube down fuse-hello.yaml
```

## Running with k8s

1. Create the pod

```
$ kubectl create -f ./fuse-hello.yaml
```

2. Verify the container creating the fuse adapter is able to use it

```
$ kubectl logs pod/fuse-hello-pod -c adapter
Hello World!
Hello World!
Hello World!
```

3. Verify the other container only using the fuse adapter is able to use it.

```
$ kubectl logs pod/fuse-hello-pod -c user
Hello World!
Hello World!
Hello World!
```

4. Delete the pod

```
$ kubectr delete -f ./fuse-hello.yaml
```


# notes

## showing mounts are shared inside the containers..

```
# findmnt -o TARGET,PROPAGATION | grep sharedvol
├─/sharedvol                                shared
│ └─/sharedvol/fuse                         shared
```

```
# cat /proc/1/mountinfo | grep sharedvol
1031 1024 252:4 /ostree/deploy/fedora-coreos/var/lib/kubelet/pods/9ad121e2-53bf-4780-ad1b-db2a98033e46/volumes/kubernetes.io~empty-dir/shared-vol /sharedvol rw,relatime shared:5 - xfs /dev/vda4 rw,seclabel,attr2,inode64,logbufs=8,logbsize=32k,prjquota
949 1031 0:184 / /sharedvol/fuse rw,nosuid,nodev,relatime shared:550 - fuse.hello hello rw,user_id=0,group_id=0
```

## see the namespaces

```
ls -l /proc/${pid}/ns/
```

