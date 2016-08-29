function [SnPM] = anova3(y, A, B, C, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

parser        = inputParser;
addOptional(parser, 'roi', [], @isnumeric);
parser.parse(varargin{:});
roi           = parser.Results.roi;

perm  = spm1d.stats.nonparam.permuters.PermuterANOVA3_0D(y, A, B, C);
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('F', perm);
