# Puppet module: stunnel

This is a Puppet module for stunnel based on the second generation layout ("NextGen") of Example42 Puppet Modules.

NOTE: The firewall and monitoring Example42 utility is not fully implemented for this module as stunnel uses more
than one port. This module is not ready to support multiple ports for monitoring and firewalling yet.

More info and documentation about stunnel in: http://www.stunnel.org

Made by Victor Garcia / Tuenti.com

Official site: http://www.example42.com

Official git repository: http://github.com/victorgp/puppet-stunnel

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install stunnel with default settings

        class { 'stunnel': }

* Install a specific version of stunnel package

        class { 'stunnel':
          version => '1.0.1',
        }

* Disable stunnel service.

        class { 'stunnel':
          disable => true
        }

* Remove stunnel package

        class { 'stunnel':
          absent => true
        }

* Enable auditing without making changes on existing stunnel configuration *files*

        class { 'stunnel':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'stunnel':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'stunnel':
          source => [ "puppet:///modules/example42/stunnel/stunnel.conf-${hostname}" , "puppet:///modules/example42/stunnel/stunnel.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'stunnel':
          source_dir       => 'puppet:///modules/example42/stunnel/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'stunnel':
          template => 'example42/stunnel/stunnel.conf.erb',
        }

* Injecting content to the template using "options". Note that the template must use "scope.function_options_lookup(['OptionName', 'DefaultValue'])" method

        class { 'stunnel':
          template => 'example42/stunnel/stunnel.conf.erb',
          options  => {
            'sslVersion' => 'SSLv3',
            'client'     => 'yes'
          }
        }

* Automatically include a custom subclass

        class { 'stunnel':
          my_class => 'example42::my_stunnel',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'stunnel':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'stunnel':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'stunnel':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'stunnel':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


## CONTINUOUS TESTING

Travis {<img src="https://travis-ci.org/victorgp/puppet-stunnel.png?branch=master" alt="Build Status" />}[https://travis-ci.org/victorgp/puppet-stunnel]
