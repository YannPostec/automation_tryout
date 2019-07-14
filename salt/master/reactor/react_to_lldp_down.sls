{% set iface = data['message'] | regex_search('A neighbor of interface (.+)\.0 has gone down\. Now, this interface has 0 neighbor') %}
launch_up:
   local.state.apply:
     - tgt: {{ data['hostname'] }}
     - arg:
       - lldp_down
     - kwarg:
         pillar:
           iface: {{ iface[0] }}
