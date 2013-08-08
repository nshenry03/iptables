# Have we decided to lock down the node?
if node[:iptables][:vagrantssh][:addresses].empty?
  # Use the all_vagrantssh rule
  iptables_rule "all_vagrantssh"
  # Disable the network vagrantssh rule
  iptables_rule "network_vagrantssh" do
    enable false
  end
else
  # Use the network rule
  iptables_rule "network_vagrantssh"
  # Disable the all traffic rule
  iptables_rule "all_vagrantssh" do
    enable false
  end
end
