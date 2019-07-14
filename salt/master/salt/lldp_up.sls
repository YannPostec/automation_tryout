{% set result = salt['junos.cli']('show lldp neighbors interface '+pillar.iface,'xml') %}
{% set syscap = result['message']['lldp-neighbors-information']['lldp-neighbor-information']['lldp-remote-system-capabilities-enabled'] %}
{% set apname = result['message']['lldp-neighbors-information']['lldp-neighbor-information']['lldp-remote-system-name'] %}
{% if syscap == 'WLAN Access Point Router' %}
salt://add_wifi.set:
  junos:
    - install_config
    - template_vars:
        iface_name: {{ pillar.iface }}
        ap_name: {{ apname }}

Commit candidate:
  junos:
    - commit
{% endif %}
