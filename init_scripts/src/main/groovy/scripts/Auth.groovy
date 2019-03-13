import jenkins.model.Jenkins
import jenkins.security.QueueItemAuthenticatorConfiguration
import hudson.model.*
import org.jenkinsci.plugins.authorizeproject.GlobalQueueItemAuthenticator
import org.jenkinsci.plugins.authorizeproject.strategy.TriggeringUsersAuthorizationStrategy


boolean createAdmin = Boolean.getBoolean("io.jenkins.dev.security.createAdmin")

def generator = { String alphabet, int n ->
  new Random().with {
    (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
  }
}
passwd = generator( (('A'..'Z')+('a'..'z')+('0'..'9')).join(), 16 )

println("admin login: "+passwd)
println("=== Configuring users")

def securityRealm = Jenkins.instance.getSecurityRealm()
if (createAdmin) {
    User admin = securityRealm.createAccount("admin", passwd)
    admin.setFullName("Admin")
}

println("=== Configure Authorize Project")
GlobalQueueItemAuthenticator auth = new GlobalQueueItemAuthenticator(
    new TriggeringUsersAuthorizationStrategy()
)
QueueItemAuthenticatorConfiguration.get().authenticators.add(auth)
