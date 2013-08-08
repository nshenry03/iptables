# Have we decided to lock down the node?
if node[:iptables][:http][:addresses].empty?
  # Use the all_ rules
  iptables_rule "all_http"
  iptables_rule "all_https"
  # Disable the network rules
  iptables_rule "network_http" do
    enable false
	end
  iptables_rule "network_https" do
    enable false
	end
else
  # Use the network rule
  iptables_rule "network_http"
  iptables_rule "network_https"
  # Disable the all traffic rules
  iptables_rule "all_http" do
    enable false
	end
  iptables_rule "all_https" do
    enable false
	end
end
