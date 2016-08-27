function [SnPM] = cca(y, x)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $


x     = spm1d.util.flatten(x);
perm  = spm1d.stats.nonparam.permuters.PermuterCCA0D(y, x);
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('X2', perm);
