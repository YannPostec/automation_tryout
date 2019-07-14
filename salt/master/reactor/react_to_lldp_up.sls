{% set iface = data['message'] | regex_search('A neighbor has come up for interface (.+)\.0\. Now, this interface has 1 neighbor') %}
launch_up:
   local.state.apply:
     - tgt: {{ data['hostname'] }}
     - arg:
       - lldp_up
     - kwarg:
         pillar:
           iface: {{ iface[0] }}
