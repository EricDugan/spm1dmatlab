%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef PermuterCCA_1D < spm1d.stats.nonparam.permuters.APermuterRegress & spm1d.stats.nonparam.permuters.APermuter1D
    methods
        function [self] = PermuterCCA_1D(y, x)
            self@spm1d.stats.nonparam.permuters.APermuterRegress(y, x)
            [J,Q,I]     = size(y);
            self.calc   = spm1d.stats.nonparam.calculators.CalculatorCCA(x, I, Q);
            self.ismultivariate = true;
        end
    end
end

