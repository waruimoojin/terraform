Gettings ArgoCD and Jenkins PASS :
.............................................................................................................
kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo

Jenkins we need to create a script inside Jenkis home directory their is the steps to follow :

kubectl get pods -n 'Your Jenkins Namespace'
kubectl exec -it -n 'Your Jenkins Namespace' jenkins-pod-name -- /bin/bash
mount | grep jenkins to find the directory path
cd to the path for directory pat/home/init.groovy.d
create 

cat <<EOF > directory pat/home/init.groovy.d/createAdminUser.groovy
#!groovy

import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("admin", "yournewpassword")
instance.setSecurityRealm(hudsonRealm)

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)

instance.save()
EOF
.............................................................................................................
kubectl -n Namespace delete pod jenkins-pod-name

Getting the Jenkins right URL  :

kubectl get svc -n Namespace



