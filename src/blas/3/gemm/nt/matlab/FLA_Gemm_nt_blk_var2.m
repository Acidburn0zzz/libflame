%
%
%   Copyright (C) 2014, The University of Texas at Austin
%
%   This file is part of libflame and is available under the 3-Clause
%   BSD license, which can be found in the LICENSE file at the top-level
%   directory, or at http://opensource.org/licenses/BSD-3-Clause
%
%

function [ C_out ] = FLA_Gemm_nt_blk_var2( alpha, A, B, C, nb_alg )

  [ AT, ...
    AB ] = FLA_Part_2x1( A, ...
                         0, 'FLA_BOTTOM' );

  [ CT, ...
    CB ] = FLA_Part_2x1( C, ...
                         0, 'FLA_BOTTOM' );

  while ( size( AB, 1 ) < size( A, 1 ) )

    b = min( size( AT, 1 ), nb_alg );

    [ A0, ...
      A1, ...
      A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                    AB, ...
                                    b, 'FLA_TOP' );

    [ C0, ...
      C1, ...
      C2 ] = FLA_Repart_2x1_to_3x1( CT, ...
                                    CB, ...
                                    b, 'FLA_TOP' );

    %------------------------------------------------------------%

    C1 = alpha * A1 * B' + C1;

    %------------------------------------------------------------%

    [ AT, ...
      AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                       A1, ...
                                       A2, ...
                                       'FLA_BOTTOM' );

    [ CT, ...
      CB ] = FLA_Cont_with_3x1_to_2x1( C0, ...
                                       C1, ...
                                       C2, ...
                                       'FLA_BOTTOM' );

  end

  C_out = [ CT
            CB ];

return

