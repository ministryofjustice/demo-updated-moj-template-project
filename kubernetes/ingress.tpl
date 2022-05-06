apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ${PROTOTYPE_NAME}-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
    external-dns.alpha.kubernetes.io/set-identifier: ${PROTOTYPE_NAME}-ingress-${PROTOTYPE_NAME}-green
    external-dns.alpha.kubernetes.io/aws-weight: "100"
spec:
  tls:
  - hosts:
    - ${PROTOTYPE_NAME}.apps.live.cloud-platform.service.justice.gov.uk
  rules:
  - host: ${PROTOTYPE_NAME}.apps.live.cloud-platform.service.justice.gov.uk
    http:
      paths:
      - path: /
        backend:
          serviceName: nginx-service
          servicePort: 3000