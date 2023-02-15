# fuse-hello
A simple Docker FUSE test container (originally from https://github.com/rustyx/fuse-hello)

# Running

1. Build the container

```
$ podman build -t fuse-hello:latest .
```

2. Run the pod with podman

```
$ podman kube play fuse-hello.yaml
```

3. Verify the container creating the fuse adapter is able to use it

```
$ podman logs fuse-hello-pod-adapter
Hello World!
Hello World!
Hello World!
```

4. Verify the other container only using the fuse adapter is able to use it.

```
$ podman logs fuse-hello-pod-user
Hello World!
Hello World!
Hello World!
```

5. Stop the pod

```
$ podman kube down fuse-hello.yaml
```

