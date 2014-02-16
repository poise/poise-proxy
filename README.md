Poise Proxy
===========

[![Build Status](https://travis-ci.org/poise/poise-proxy.png?branch=master)](https://travis-ci.org/poise/poise-proxy)

Quick Start
-----------

Add `depends 'poise-proxy'` to your `metadata.rb` and then in your recipe:

```ruby
poise_proxy 'myproxy' do
  port 8080
end
```

Attributes
----------

* `node['poise-proxy']['listen_ports']` – HTTP ports for the proxy. *(default: [80])*
* `node['poise-proxy']['hostname']` – Server name for the proxy. *(default: node['fqdn'])*
* `node['poise-proxy']['ssl_enabled']` – Configure HTTPS support. *(default: false)*
* `node['poise-proxy']['ssl_redirect_http']` – Redirect from http: to https: if SSL is enabled. *(default: true)*
* `node['poise-proxy']['ssl_listen_ports']` – HTTPS ports for the proxy. *(default: [443])*
* `node['poise-proxy']['ssl_path']` – Base path for SSL-related files. *(default: /etc/ssl)*
* `node['poise-proxy']['ssl_cert_path']` – Path to the SSL certificate. *(default: /etc/ssl/name.pem)*
* `node['poise-proxy']['ssl_key_path']` – Path to the SSL private key. *(default: /etc/ssl/name.key)*
* `node['poise-proxy']['provider']` – Proxy provider to use. One of: nginx, apache. *(default: auto-detect based on run list)*

Resources
---------

### poise_proxy

The `poise_proxy` resource defines a proxy server instance.

```ruby
poise_proxy 'name' do
  parent 'my_api[production]'
end
```

* `proxy_name` – Name of the proxy instance. *(name_attribute)*
* `port` – Backend port to proxy to. *(default: parent.port or 8080)*
* `parent` – Reference to a resource to proxy to. *(optional)*
