package VM::EC2::REST::rds;

use strict;
use VM::EC2 '';  # important not to import anything!
package VM::EC2;  # add methods to VM::EC2

VM::EC2::Dispatch->register(
    DescribeDBInstances  => sub {
        VM::EC2::Dispatch::load_module('VM::EC2::RDS::Instance');
        my ($xml, $ec2) = @_;
        my $instances   = $xml->{DescribeDBInstancesResult}{Instances};
        return map {
                VM::EC2::RDS::Instance->new($_, $ec2)
            } @$instances;
    },
);

=head1 AUTHOR

Ferran Arau E<lt>ferran.arau.castell@gmail.comE<gt>.

Copyright (c)

This package and its accompanying libraries is free software; you can
redistribute it and/or modify it under the terms of the GPL (either
version 1, or at your option, any later version) or the Artistic
License 2.0.  Refer to LICENSE for the full license text. In addition,
please see DISCLAIMER.txt for disclaimers of warranty.

=cut


1;
