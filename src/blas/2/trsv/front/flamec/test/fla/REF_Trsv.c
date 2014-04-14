/*

    Copyright (C) 2014, The University of Texas at Austin

    This file is part of libflame and is available under the 3-Clause
    BSD license, which can be found in the LICENSE file at the top-level
    directory, or at http://opensource.org/licenses/BSD-3-Clause

*/

#include "FLAME.h"

FLA_Error REF_Trsv( FLA_Uplo uplo, FLA_Trans trans, FLA_Diag diag, FLA_Obj A, FLA_Obj x )
{
  FLA_Trsv_external( uplo, trans, diag, A, x );

  return 0;
}
