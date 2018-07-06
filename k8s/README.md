# Deploying keyfender in kubernetes

It is possible to deploy the keyfender application backed by an irmin database
within kubernetes, so that the unikernel runs in a real small VM, which is
started from an *unprivileged* container with a minimal
[solo5](https://github.com/Solo5/solo5) wrapper. In order to achieve that, the
kubernetes deployment must provide the device plugin `devices.kubevirt.io/kvm`,
that makes the /dev/kvm device available to unprivileged containers.

## Prerequisistes on kubernetes node

If kubernetes doesn't run bare-metal, nested virtualizaion must be enabled for
the kubernetes node(s) and /dev/kvm must exist. For further details how to do
that for minikube, refer to the [kubevirt documentation](https://github.com/kubevirt/demo#appendix-deploying-minikube).

## Installing KVM device plugin

The KVM device plugin is already available, if
[kubevirt](https://github.com/kubevirt/kubevirt) is installed in kubernetes
deployment. If not, the device plugin can also be installed individually with
creating a DaemonSet:

```
$ kubectl create -f https://github.com/kubevirt/kubernetes-device-plugins/raw/master/manifests/kvm-ds.yml
```

## Deploying keyfender

Deploying keyfender is then as easy as executing this command:

```
$ kubectl create -f keyfender-config.yaml -f irmin-pvc.yaml -f irmin-deployment.yaml -f keyfender-deployment.yaml
```

You can check the logs of the keyfender pod with:
```
$ kubectl logs -l app=keyfender,tier=api
```
and look for the text `##### Starting keyfender as kvm instance #####` to make
sure, the unikernel really runs as a VM.


