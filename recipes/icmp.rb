# Have we decided to lock down the node?
if node[:iptables][:icmp][:addresses].empty?
  # Use the all_icmp rule
  iptables_rule "all_icmp"
  # Disable the network icmp rule
  iptables_rule "network_icmp" do
    enable false
  end
else
  # Use the network rule
  iptables_rule "network_icmp"
  # Disable the all traffic rule
  iptables_rule "all_icmp" do
    enable false
  end
end
