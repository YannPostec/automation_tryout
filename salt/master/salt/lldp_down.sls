{% set result = salt['junos.rpc']('get-config','','xml',filter='<interfaces><interface></interface></interfaces>') %}
{% for intw in result['rpc_reply']['configuration']['interfaces']['interface'] %}
{% if intw['name'] == pillar.iface %}
{% if intw['apply-groups'] == "WIFI" %}
salt://del_wifi.set:
  junos:
    - install_config
    - template_vars:
        iface_name: {{ pillar.iface }}
{% endif %}        
{% endif %}
{% endfor %}
