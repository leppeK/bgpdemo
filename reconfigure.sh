cat demo.clab.yaml.template | NODE1=$(cat talos/node1.yaml | base64 -w0) NODE2=$(cat talos/node2.yaml | base64 -w0) envsubst >demo.clab.yaml && sudo containerlab redeploy
