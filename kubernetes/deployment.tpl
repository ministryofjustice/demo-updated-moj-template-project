apiVersion: apps/v1
kind: Deployment
metadata:
  name: moj-prototype
spec:
  replicas: 1
  selector:
    matchLabels:
      app: prototype
  template:
    metadata:
      labels:
        app: prototype
    spec:
      containers:
      - name: nginx
        image: 754256621582.dkr.ecr.eu-west-2.amazonaws.com/${ECR_NAME}:${IMAGE_TAG}
        env:
          - name: USERNAME
            valueFrom:
              secretKeyRef:
                name: basic-auth
                key: username
          - name: PASSWORD
            valueFrom:
              secretKeyRef:
                name: basic-auth
                key: password
        ports:
        - containerPort: 3000