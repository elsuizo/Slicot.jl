## Raw call strings for SLICOT routines ##
# For most cases you probably want to use Slicot.Simple
module Raw
import Base.USE_BLAS64

if USE_BLAS64
    typealias BlasInt Int64
else
    typealias BlasInt Int32
end

function AB01MD(JOBZ::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,1}, NCONT::BlasInt,
    Z::Array{Float64,2}, LDZ::BlasInt, TAU::Array{Float64,1},
    TOL::Float64, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ab01md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &JOBZ, &N, A,
            &LDA, B, &NCONT, Z, &LDZ, TAU, &TOL, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB01MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB01ND(JOBZ::Char, N::BlasInt, M::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, NCONT::BlasInt, INDCON::BlasInt,
    NBLK::Array{BlasInt,1}, Z::Array{Float64,2}, LDZ::BlasInt,
    TAU::Array{Float64,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:ab01nd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOBZ, &N, &M, A, &LDA, B, &LDB, &NCONT, &INDCON, NBLK,
            Z, &LDZ, TAU, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB01ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB01OD(STAGES::Char, JOBU::Char, JOBV::Char, N::BlasInt,
    M::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, U::Array{Float64,2},
    LDU::BlasInt, V::Array{Float64,2}, LDV::BlasInt, NCONT::BlasInt,
    INDCON::BlasInt, KSTAIR::Array{BlasInt,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ab01od_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &STAGES,
            &JOBU, &JOBV, &N, &M, A, &LDA, B, &LDB, U, &LDU, V,
            &LDV, &NCONT, &INDCON, KSTAIR, &TOL, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB01OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB04MD(TYPE::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    ALPHA::Float64, BETA::Float64, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ab04md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &TYPE, &N, &M, &P, &ALPHA, &BETA, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB04MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB05MD(UPLO::Char, OVER::Char, N1::BlasInt, M1::BlasInt,
    P1::BlasInt, N2::BlasInt, P2::BlasInt, A1::Array{Float64,2},
    LDA1::BlasInt, B1::Array{Float64,2}, LDB1::BlasInt,
    C1::Array{Float64,2}, LDC1::BlasInt, D1::Array{Float64,2},
    LDD1::BlasInt, A2::Array{Float64,2}, LDA2::BlasInt,
    B2::Array{Float64,2}, LDB2::BlasInt, C2::Array{Float64,2},
    LDC2::BlasInt, D2::Array{Float64,2}, LDD2::BlasInt, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:ab05md_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &UPLO, &OVER, &N1, &M1, &P1, &N2, &P2,
            A1, &LDA1, B1, &LDB1, C1, &LDC1, D1, &LDD1, A2, &LDA2,
            B2, &LDB2, C2, &LDC2, D2, &LDD2, &N, A, &LDA, B, &LDB,
            C, &LDC, D, &LDD, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB05MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB05ND(OVER::Char, N1::BlasInt, M1::BlasInt, P1::BlasInt,
    N2::BlasInt, ALPHA::Float64, A1::Array{Float64,2}, LDA1::BlasInt,
    B1::Array{Float64,2}, LDB1::BlasInt, C1::Array{Float64,2},
    LDC1::BlasInt, D1::Array{Float64,2}, LDD1::BlasInt,
    A2::Array{Float64,2}, LDA2::BlasInt, B2::Array{Float64,2},
    LDB2::BlasInt, C2::Array{Float64,2}, LDC2::BlasInt,
    D2::Array{Float64,2}, LDD2::BlasInt, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:ab05nd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &OVER, &N1, &M1, &P1, &N2, &ALPHA, A1,
            &LDA1, B1, &LDB1, C1, &LDC1, D1, &LDD1, A2, &LDA2, B2,
            &LDB2, C2, &LDC2, D2, &LDD2, &N, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB05ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB05OD(OVER::Char, N1::BlasInt, M1::BlasInt, P1::BlasInt,
    N2::BlasInt, M2::BlasInt, ALPHA::Float64, A1::Array{Float64,2},
    LDA1::BlasInt, B1::Array{Float64,2}, LDB1::BlasInt,
    C1::Array{Float64,2}, LDC1::BlasInt, D1::Array{Float64,2},
    LDD1::BlasInt, A2::Array{Float64,2}, LDA2::BlasInt,
    B2::Array{Float64,2}, LDB2::BlasInt, C2::Array{Float64,2},
    LDC2::BlasInt, D2::Array{Float64,2}, LDD2::BlasInt, N::BlasInt,
    M::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt, INFO::BlasInt)

    ccall((:ab05od_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &OVER, &N1, &M1, &P1, &N2, &M2, &ALPHA, A1, &LDA1, B1,
            &LDB1, C1, &LDC1, D1, &LDD1, A2, &LDA2, B2, &LDB2, C2,
            &LDC2, D2, &LDD2, &N, &M, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB05OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB05PD(OVER::Char, N1::BlasInt, M::BlasInt, P::BlasInt,
    N2::BlasInt, ALPHA::Float64, A1::Array{Float64,2}, LDA1::BlasInt,
    B1::Array{Float64,2}, LDB1::BlasInt, C1::Array{Float64,2},
    LDC1::BlasInt, D1::Array{Float64,2}, LDD1::BlasInt,
    A2::Array{Float64,2}, LDA2::BlasInt, B2::Array{Float64,2},
    LDB2::BlasInt, C2::Array{Float64,2}, LDC2::BlasInt,
    D2::Array{Float64,2}, LDD2::BlasInt, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, INFO::BlasInt)

    ccall((:ab05pd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &OVER, &N1, &M, &P, &N2,
            &ALPHA, A1, &LDA1, B1, &LDB1, C1, &LDC1, D1, &LDD1, A2,
            &LDA2, B2, &LDB2, C2, &LDC2, D2, &LDD2, &N, A, &LDA, B,
            &LDB, C, &LDC, D, &LDD, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB05PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB05QD(OVER::Char, N1::BlasInt, M1::BlasInt, P1::BlasInt,
    N2::BlasInt, M2::BlasInt, P2::BlasInt, A1::Array{Float64,2},
    LDA1::BlasInt, B1::Array{Float64,2}, LDB1::BlasInt,
    C1::Array{Float64,2}, LDC1::BlasInt, D1::Array{Float64,2},
    LDD1::BlasInt, A2::Array{Float64,2}, LDA2::BlasInt,
    B2::Array{Float64,2}, LDB2::BlasInt, C2::Array{Float64,2},
    LDC2::BlasInt, D2::Array{Float64,2}, LDD2::BlasInt, N::BlasInt,
    M::BlasInt, P::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt, INFO::BlasInt)

    ccall((:ab05qd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &OVER, &N1, &M1, &P1, &N2, &M2, &P2, A1,
            &LDA1, B1, &LDB1, C1, &LDC1, D1, &LDD1, A2, &LDA2, B2,
            &LDB2, C2, &LDC2, D2, &LDD2, &N, &M, &P, A, &LDA, B,
            &LDB, C, &LDC, D, &LDD, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB05QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB05RD(FBTYPE::Char, JOBD::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, MV::BlasInt, PZ::BlasInt, ALPHA::Float64,
    BETA::Float64, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt,
    F::Array{Float64,2}, LDF::BlasInt, K::Array{Float64,2},
    LDK::BlasInt, G::Array{Float64,2}, LDG::BlasInt,
    H::Array{Float64,2}, LDH::BlasInt, RCOND::Float64,
    BC::Array{Float64,2}, LDBC::BlasInt, CC::Array{Float64,2},
    LDCC::BlasInt, DC::Array{Float64,2}, LDDC::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ab05rd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &FBTYPE, &JOBD, &N, &M, &P,
            &MV, &PZ, &ALPHA, &BETA, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, F, &LDF, K, &LDK, G, &LDG, H, &LDH, &RCOND, BC,
            &LDBC, CC, &LDCC, DC, &LDDC, IWORK, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB05RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB05SD(FBTYPE::Char, JOBD::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, ALPHA::Float64, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt,
    F::Array{Float64,2}, LDF::BlasInt, RCOND::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ab05sd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &FBTYPE,
            &JOBD, &N, &M, &P, &ALPHA, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, F, &LDF, &RCOND, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB05SD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB07MD(JOBD::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, INFO::BlasInt)

    ccall((:ab07md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &JOBD, &N,
            &M, &P, A, &LDA, B, &LDB, C, &LDC, D, &LDD, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB07MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB07ND(N::BlasInt, M::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, D::Array{Float64,2},
    LDD::BlasInt, RCOND::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:ab07nd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &N, &M, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, &RCOND, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB07ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB08MD(EQUIL::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, RANK::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ab08md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &EQUIL, &N, &M, &P, A, &LDA, B, &LDB, C, &LDC, D, &LDD,
            &RANK, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB08MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB08MZ(EQUIL::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Complex128,2}, LDA::BlasInt, B::Array{Complex128,2},
    LDB::BlasInt, C::Array{Complex128,2}, LDC::BlasInt,
    D::Array{Complex128,2}, LDD::BlasInt, RANK::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    ZWORK::Array{Complex128,1}, LZWORK::BlasInt, INFO::BlasInt)

    ccall((:ab08mz_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{BlasInt}), &EQUIL, &N, &M, &P, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, &RANK, &TOL, IWORK, DWORK, ZWORK,
            &LZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB08MZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB08ND(EQUIL::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, NU::BlasInt, RANK::BlasInt,
    DINFZ::BlasInt, NKROR::BlasInt, NKROL::BlasInt,
    INFZ::Array{BlasInt,1}, KRONR::Array{BlasInt,1},
    KRONL::Array{BlasInt,1}, AF::Array{Float64,2}, LDAF::BlasInt,
    BF::Array{Float64,2}, LDBF::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ab08nd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &EQUIL, &N,
            &M, &P, A, &LDA, B, &LDB, C, &LDC, D, &LDD, &NU, &RANK,
            &DINFZ, &NKROR, &NKROL, INFZ, KRONR, KRONL, AF, &LDAF,
            BF, &LDBF, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB08ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB08NX(N::BlasInt, M::BlasInt, P::BlasInt, RO::BlasInt,
    SIGMA::BlasInt, SVLMAX::Float64, ABCD::Array{Float64,2},
    LDABCD::BlasInt, NINFZ::BlasInt, INFZ::Array{BlasInt,1},
    KRONL::Array{BlasInt,1}, MU::BlasInt, NU::BlasInt, NKROL::BlasInt,
    TOL::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:ab08nx_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &N, &M, &P, &RO, &SIGMA, &SVLMAX, ABCD,
            &LDABCD, &NINFZ, INFZ, KRONL, &MU, &NU, &NKROL, &TOL,
            IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB08NX: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB08NZ(EQUIL::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Complex128,2}, LDA::BlasInt, B::Array{Complex128,2},
    LDB::BlasInt, C::Array{Complex128,2}, LDC::BlasInt,
    D::Array{Complex128,2}, LDD::BlasInt, NU::BlasInt, RANK::BlasInt,
    DINFZ::BlasInt, NKROR::BlasInt, NKROL::BlasInt,
    INFZ::Array{BlasInt,1}, KRONR::Array{BlasInt,1},
    KRONL::Array{BlasInt,1}, AF::Array{Complex128,2}, LDAF::BlasInt,
    BF::Array{Complex128,2}, LDBF::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    ZWORK::Array{Complex128,1}, LZWORK::BlasInt, INFO::BlasInt)

    ccall((:ab08nz_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{BlasInt}), &EQUIL, &N, &M, &P, A,
            &LDA, B, &LDB, C, &LDC, D, &LDD, &NU, &RANK, &DINFZ,
            &NKROR, &NKROL, INFZ, KRONR, KRONL, AF, &LDAF, BF,
            &LDBF, &TOL, IWORK, DWORK, ZWORK, &LZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB08NZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09AD(DICO::Char, JOB::Char, EQUIL::Char, ORDSEL::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, NR::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    HSV::Array{Float64,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ab09ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOB,
            &EQUIL, &ORDSEL, &N, &M, &P, &NR, A, &LDA, B, &LDB, C,
            &LDC, HSV, &TOL, IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09AX(DICO::Char, JOB::Char, ORDSEL::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, NR::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, HSV::Array{Float64,1},
    T::Array{Float64,2}, LDT::BlasInt, TI::Array{Float64,2},
    LDTI::BlasInt, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ab09ax_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOB, &ORDSEL, &N,
            &M, &P, &NR, A, &LDA, B, &LDB, C, &LDC, HSV, T, &LDT,
            TI, &LDTI, &TOL, IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09AX: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09BD(DICO::Char, JOB::Char, EQUIL::Char, ORDSEL::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, NR::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, HSV::Array{Float64,1},
    TOL1::Float64, TOL2::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ab09bd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOB, &EQUIL,
            &ORDSEL, &N, &M, &P, &NR, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, HSV, &TOL1, &TOL2, IWORK, DWORK, &LDWORK, &IWARN,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09BX(DICO::Char, JOB::Char, ORDSEL::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, NR::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, D::Array{Float64,2},
    LDD::BlasInt, HSV::Array{Float64,1}, T::Array{Float64,2},
    LDT::BlasInt, TI::Array{Float64,2}, LDTI::BlasInt, TOL1::Float64,
    TOL2::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09bx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &DICO, &JOB, &ORDSEL, &N, &M, &P, &NR, A,
            &LDA, B, &LDB, C, &LDC, D, &LDD, HSV, T, &LDT, TI,
            &LDTI, &TOL1, &TOL2, IWORK, DWORK, &LDWORK, &IWARN,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09BX: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09CD(DICO::Char, EQUIL::Char, ORDSEL::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, NR::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, D::Array{Float64,2},
    LDD::BlasInt, HSV::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09cd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &DICO, &EQUIL, &ORDSEL, &N, &M, &P, &NR,
            A, &LDA, B, &LDB, C, &LDC, D, &LDD, HSV, &TOL1, &TOL2,
            IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09CD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09CX(DICO::Char, ORDSEL::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, NR::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt,
    HSV::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09cx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &DICO, &ORDSEL, &N, &M, &P, &NR, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, HSV, &TOL1, &TOL2, IWORK, DWORK, &LDWORK,
            &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09CX: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09DD(DICO::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    NR::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt, RCOND::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:ab09dd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}), &DICO, &N,
            &M, &P, &NR, A, &LDA, B, &LDB, C, &LDC, D, &LDD, &RCOND,
            IWORK, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09DD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09ED(DICO::Char, EQUIL::Char, ORDSEL::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, NR::BlasInt, ALPHA::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, NS::BlasInt,
    HSV::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09ed_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &DICO,
            &EQUIL, &ORDSEL, &N, &M, &P, &NR, &ALPHA, A, &LDA, B,
            &LDB, C, &LDC, D, &LDD, &NS, HSV, &TOL1, &TOL2, IWORK,
            DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09ED: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09FD(DICO::Char, JOBCF::Char, FACT::Char, JOBMR::Char,
    EQUIL::Char, ORDSEL::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    NR::BlasInt, ALPHA::Float64, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, NQ::BlasInt, HSV::Array{Float64,1}, TOL1::Float64,
    TOL2::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09fd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &DICO, &JOBCF, &FACT, &JOBMR, &EQUIL, &ORDSEL, &N, &M,
            &P, &NR, &ALPHA, A, &LDA, B, &LDB, C, &LDC, &NQ, HSV,
            &TOL1, &TOL2, IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09FD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09GD(DICO::Char, JOBCF::Char, FACT::Char, JOBMR::Char,
    EQUIL::Char, ORDSEL::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    NR::BlasInt, ALPHA::Float64, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt, NQ::BlasInt,
    HSV::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    TOL3::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09gd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &DICO,
            &JOBCF, &FACT, &JOBMR, &EQUIL, &ORDSEL, &N, &M, &P, &NR,
            &ALPHA, A, &LDA, B, &LDB, C, &LDC, D, &LDD, &NQ, HSV,
            &TOL1, &TOL2, &TOL3, IWORK, DWORK, &LDWORK, &IWARN,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09GD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09HD(DICO::Char, JOB::Char, EQUIL::Char, ORDSEL::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, NR::BlasInt, ALPHA::Float64,
    BETA::Float64, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt, NS::BlasInt,
    HSV::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    BWORK::Array{Bool,1}, IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09hd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOB, &EQUIL,
            &ORDSEL, &N, &M, &P, &NR, &ALPHA, &BETA, A, &LDA, B,
            &LDB, C, &LDC, D, &LDD, &NS, HSV, &TOL1, &TOL2, IWORK,
            DWORK, &LDWORK, BWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09HD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09HX(DICO::Char, JOB::Char, ORDSEL::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, NR::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, D::Array{Float64,2},
    LDD::BlasInt, HSV::Array{Float64,1}, T::Array{Float64,2},
    LDT::BlasInt, TI::Array{Float64,2}, LDTI::BlasInt, TOL1::Float64,
    TOL2::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, BWORK::Array{Bool,1}, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ab09hx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOB, &ORDSEL, &N,
            &M, &P, &NR, A, &LDA, B, &LDB, C, &LDC, D, &LDD, HSV, T,
            &LDT, TI, &LDTI, &TOL1, &TOL2, IWORK, DWORK, &LDWORK,
            BWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09HX: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09HY(N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, SCALEC::Float64,
    SCALEO::Float64, S::Array{Float64,2}, LDS::BlasInt,
    R::Array{Float64,2}, LDR::BlasInt, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, BWORK::Array{Bool,1},
    INFO::BlasInt)

    ccall((:ab09hy_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Bool}, Ptr{BlasInt}),
            &N, &M, &P, A, &LDA, B, &LDB, C, &LDC, D, &LDD, &SCALEC,
            &SCALEO, S, &LDS, R, &LDR, IWORK, DWORK, &LDWORK, BWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09HY: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09ID(DICO::Char, JOBC::Char, JOBO::Char, JOB::Char,
    WEIGHT::Char, EQUIL::Char, ORDSEL::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, NV::BlasInt, PV::BlasInt, NW::BlasInt, MW::BlasInt,
    NR::BlasInt, ALPHA::Float64, ALPHAC::Float64, ALPHAO::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, AV::Array{Float64,2},
    LDAV::BlasInt, BV::Array{Float64,2}, LDBV::BlasInt,
    CV::Array{Float64,2}, LDCV::BlasInt, DV::Array{Float64,2},
    LDDV::BlasInt, AW::Array{Float64,2}, LDAW::BlasInt,
    BW::Array{Float64,2}, LDBW::BlasInt, CW::Array{Float64,2},
    LDCW::BlasInt, DW::Array{Float64,2}, LDDW::BlasInt, NS::BlasInt,
    HSV::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09id_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &DICO, &JOBC, &JOBO, &JOB, &WEIGHT, &EQUIL, &ORDSEL, &N,
            &M, &P, &NV, &PV, &NW, &MW, &NR, &ALPHA, &ALPHAC,
            &ALPHAO, A, &LDA, B, &LDB, C, &LDC, D, &LDD, AV, &LDAV,
            BV, &LDBV, CV, &LDCV, DV, &LDDV, AW, &LDAW, BW, &LDBW,
            CW, &LDCW, DW, &LDDW, &NS, HSV, &TOL1, &TOL2, IWORK,
            DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09ID: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09IX(DICO::Char, JOB::Char, FACT::Char, ORDSEL::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, NR::BlasInt, SCALEC::Float64,
    SCALEO::Float64, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt,
    TI::Array{Float64,2}, LDTI::BlasInt, T::Array{Float64,2},
    LDT::BlasInt, NMINR::BlasInt, HSV::Array{Float64,1},
    TOL1::Float64, TOL2::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ab09ix_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &DICO, &JOB, &FACT, &ORDSEL, &N, &M, &P,
            &NR, &SCALEC, &SCALEO, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, TI, &LDTI, T, &LDT, &NMINR, HSV, &TOL1, &TOL2,
            IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09IX: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09IY(DICO::Char, JOBC::Char, JOBO::Char, WEIGHT::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, NV::BlasInt, PV::BlasInt,
    NW::BlasInt, MW::BlasInt, ALPHAC::Float64, ALPHAO::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    AV::Array{Float64,2}, LDAV::BlasInt, BV::Array{Float64,2},
    LDBV::BlasInt, CV::Array{Float64,2}, LDCV::BlasInt,
    DV::Array{Float64,2}, LDDV::BlasInt, AW::Array{Float64,2},
    LDAW::BlasInt, BW::Array{Float64,2}, LDBW::BlasInt,
    CW::Array{Float64,2}, LDCW::BlasInt, DW::Array{Float64,2},
    LDDW::BlasInt, SCALEC::Float64, SCALEO::Float64,
    S::Array{Float64,2}, LDS::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ab09iy_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOBC, &JOBO,
            &WEIGHT, &N, &M, &P, &NV, &PV, &NW, &MW, &ALPHAC,
            &ALPHAO, A, &LDA, B, &LDB, C, &LDC, AV, &LDAV, BV,
            &LDBV, CV, &LDCV, DV, &LDDV, AW, &LDAW, BW, &LDBW, CW,
            &LDCW, DW, &LDDW, &SCALEC, &SCALEO, S, &LDS, R, &LDR,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09IY: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09JD(JOBV::Char, JOBW::Char, JOBINV::Char, DICO::Char,
    EQUIL::Char, ORDSEL::Char, N::BlasInt, NV::BlasInt, NW::BlasInt,
    M::BlasInt, P::BlasInt, NR::BlasInt, ALPHA::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, AV::Array{Float64,2},
    LDAV::BlasInt, BV::Array{Float64,2}, LDBV::BlasInt,
    CV::Array{Float64,2}, LDCV::BlasInt, DV::Array{Float64,2},
    LDDV::BlasInt, AW::Array{Float64,2}, LDAW::BlasInt,
    BW::Array{Float64,2}, LDBW::BlasInt, CW::Array{Float64,2},
    LDCW::BlasInt, DW::Array{Float64,2}, LDDW::BlasInt, NS::BlasInt,
    HSV::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09jd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOBV, &JOBW, &JOBINV, &DICO, &EQUIL, &ORDSEL, &N, &NV,
            &NW, &M, &P, &NR, &ALPHA, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, AV, &LDAV, BV, &LDBV, CV, &LDCV, DV, &LDDV, AW,
            &LDAW, BW, &LDBW, CW, &LDCW, DW, &LDDW, &NS, HSV, &TOL1,
            &TOL2, IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09JD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09JV(JOB::Char, DICO::Char, JOBEV::Char, STBCHK::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, NV::BlasInt, PV::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, AV::Array{Float64,2},
    LDAV::BlasInt, EV::Array{Float64,2}, LDEV::BlasInt,
    BV::Array{Float64,2}, LDBV::BlasInt, CV::Array{Float64,2},
    LDCV::BlasInt, DV::Array{Float64,2}, LDDV::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ab09jv_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOB, &DICO, &JOBEV, &STBCHK, &N, &M, &P,
            &NV, &PV, A, &LDA, B, &LDB, C, &LDC, D, &LDD, AV, &LDAV,
            EV, &LDEV, BV, &LDBV, CV, &LDCV, DV, &LDDV, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09JV: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09JW(JOB::Char, DICO::Char, JOBEW::Char, STBCHK::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, NW::BlasInt, MW::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, AW::Array{Float64,2},
    LDAW::BlasInt, EW::Array{Float64,2}, LDEW::BlasInt,
    BW::Array{Float64,2}, LDBW::BlasInt, CW::Array{Float64,2},
    LDCW::BlasInt, DW::Array{Float64,2}, LDDW::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ab09jw_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOB, &DICO, &JOBEW, &STBCHK, &N, &M, &P,
            &NW, &MW, A, &LDA, B, &LDB, C, &LDC, D, &LDD, AW, &LDAW,
            EW, &LDEW, BW, &LDBW, CW, &LDCW, DW, &LDDW, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09JW: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09JX(DICO::Char, STDOM::Char, EVTYPE::Char, N::BlasInt,
    ALPHA::Float64, ER::Array{Float64,1}, EI::Array{Float64,1},
    ED::Array{Float64,1}, TOLINF::Float64, INFO::BlasInt)

    ccall((:ab09jx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &DICO, &STDOM, &EVTYPE, &N, &ALPHA, ER, EI, ED, &TOLINF,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09JX: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09KD(JOB::Char, DICO::Char, WEIGHT::Char, EQUIL::Char,
    ORDSEL::Char, N::BlasInt, NV::BlasInt, NW::BlasInt, M::BlasInt,
    P::BlasInt, NR::BlasInt, ALPHA::Float64, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, D::Array{Float64,2},
    LDD::BlasInt, AV::Array{Float64,2}, LDAV::BlasInt,
    BV::Array{Float64,2}, LDBV::BlasInt, CV::Array{Float64,2},
    LDCV::BlasInt, DV::Array{Float64,2}, LDDV::BlasInt,
    AW::Array{Float64,2}, LDAW::BlasInt, BW::Array{Float64,2},
    LDBW::BlasInt, CW::Array{Float64,2}, LDCW::BlasInt,
    DW::Array{Float64,2}, LDDW::BlasInt, NS::BlasInt,
    HSV::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09kd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &DICO,
            &WEIGHT, &EQUIL, &ORDSEL, &N, &NV, &NW, &M, &P, &NR,
            &ALPHA, A, &LDA, B, &LDB, C, &LDC, D, &LDD, AV, &LDAV,
            BV, &LDBV, CV, &LDCV, DV, &LDDV, AW, &LDAW, BW, &LDBW,
            CW, &LDCW, DW, &LDDW, &NS, HSV, &TOL1, &TOL2, IWORK,
            DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09KD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09KX(JOB::Char, DICO::Char, WEIGHT::Char, N::BlasInt,
    NV::BlasInt, NW::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, AV::Array{Float64,2},
    LDAV::BlasInt, BV::Array{Float64,2}, LDBV::BlasInt,
    CV::Array{Float64,2}, LDCV::BlasInt, DV::Array{Float64,2},
    LDDV::BlasInt, AW::Array{Float64,2}, LDAW::BlasInt,
    BW::Array{Float64,2}, LDBW::BlasInt, CW::Array{Float64,2},
    LDCW::BlasInt, DW::Array{Float64,2}, LDDW::BlasInt,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ab09kx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &DICO, &WEIGHT, &N,
            &NV, &NW, &M, &P, A, &LDA, B, &LDB, C, &LDC, D, &LDD,
            AV, &LDAV, BV, &LDBV, CV, &LDCV, DV, &LDDV, AW, &LDAW,
            BW, &LDBW, CW, &LDCW, DW, &LDDW, DWORK, &LDWORK, &IWARN,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09KX: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09MD(DICO::Char, JOB::Char, EQUIL::Char, ORDSEL::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, NR::BlasInt, ALPHA::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt, NS::BlasInt,
    HSV::Array{Float64,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ab09md_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &DICO, &JOB, &EQUIL, &ORDSEL, &N, &M, &P,
            &NR, &ALPHA, A, &LDA, B, &LDB, C, &LDC, &NS, HSV, &TOL,
            IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB09ND(DICO::Char, JOB::Char, EQUIL::Char, ORDSEL::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, NR::BlasInt, ALPHA::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, NS::BlasInt,
    HSV::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ab09nd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &DICO, &JOB, &EQUIL, &ORDSEL, &N, &M, &P, &NR, &ALPHA,
            A, &LDA, B, &LDB, C, &LDC, D, &LDD, &NS, HSV, &TOL1,
            &TOL2, IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB09ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function AB13DD(DICO::Char, JOBE::Char, EQUIL::Char, JOBD::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, FPEAK::Array{Float64,1},
    A::Array{Float64,1}, LDA::Float64, E::Array{Float64,1},
    LDE::Float64, B::Array{Float64,1}, LDB::Float64,
    C::Array{Float64,1}, LDC::Float64, D::Array{Float64,1},
    LDD::Float64, GPEAK::Array{Float64,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    CWORK::Array{Complex128,1}, LCWORK::BlasInt, INFO::BlasInt)

    ccall((:ab13dd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{BlasInt}), &DICO, &JOBE, &EQUIL, &JOBD, &N, &M, &P,
            FPEAK, A, &LDA, E, &LDE, B, &LDB, C, &LDC, D, &LDD,
            GPEAK, &TOL, IWORK, DWORK, &LDWORK, CWORK, &LCWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB13DD: the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function AB13ED(N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    LOW::Float64, HIGH::Float64, TOL::Float64,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:ab13ed_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, A, &LDA,
            &LOW, &HIGH, &TOL, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB13ED: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB13FD(N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    BETA::Float64, OMEGA::Float64, TOL::Float64,
    DWORK::Array{Float64,1}, LDWORK::BlasInt,
    CWORK::Array{Complex128,1}, LCWORK::BlasInt, INFO::BlasInt)

    ccall((:ab13fd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, A, &LDA, &BETA, &OMEGA,
            &TOL, DWORK, &LDWORK, CWORK, &LCWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB13FD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB13MD(FACT::Char, N::BlasInt, Z::Array{Complex128,1},
    LDZ::Complex128, M::BlasInt, NBLOCK::Array{BlasInt,1},
    ITYPE::Array{BlasInt,1}, X::Array{Float64,1}, BOUND::Float64,
    D::Array{Float64,1}, G::Array{Float64,1}, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt,
    ZWORK::Array{Complex128,1}, LZWORK::BlasInt, INFO::BlasInt)

    ccall((:ab13md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{BlasInt}), &FACT, &N, Z, &LDZ, &M, NBLOCK, ITYPE, X,
            &BOUND, D, G, IWORK, DWORK, &LDWORK, ZWORK, &LZWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB13MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AB8NXZ(N::BlasInt, M::BlasInt, P::BlasInt, RO::BlasInt,
    SIGMA::BlasInt, SVLMAX::Float64, ABCD::Array{Complex128,2},
    LDABCD::BlasInt, NINFZ::BlasInt, INFZ::Array{BlasInt,1},
    KRONL::Array{BlasInt,1}, MU::BlasInt, NU::BlasInt, NKROL::BlasInt,
    TOL::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    ZWORK::Array{Complex128,1}, LZWORK::BlasInt, INFO::BlasInt)

    ccall((:ab8nxz_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{BlasInt}), &N, &M,
            &P, &RO, &SIGMA, &SVLMAX, ABCD, &LDABCD, &NINFZ, INFZ,
            KRONL, &MU, &NU, &NKROL, &TOL, IWORK, DWORK, ZWORK,
            &LZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AB8NXZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function AG07BD(JOBE::Char, N::BlasInt, M::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, E::Array{Float64,2},
    LDE::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, D::Array{Float64,2},
    LDD::BlasInt, AI::Array{Float64,2}, LDAI::BlasInt,
    EI::Array{Float64,2}, LDEI::BlasInt, BI::Array{Float64,2},
    LDBI::BlasInt, CI::Array{Float64,2}, LDCI::BlasInt,
    DI::Array{Float64,2}, LDDI::BlasInt, INFO::BlasInt)

    ccall((:ag07bd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOBE, &N, &M, A, &LDA, E,
            &LDE, B, &LDB, C, &LDC, D, &LDD, AI, &LDAI, EI, &LDEI,
            BI, &LDBI, CI, &LDCI, DI, &LDDI, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AG07BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AG08BD(EQUIL::Char, L::BlasInt, N::BlasInt, M::BlasInt,
    P::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    E::Array{Float64,2}, LDE::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, NFZ::BlasInt, NRANK::BlasInt,
    NIZ::BlasInt, DINFZ::BlasInt, NKROR::BlasInt, NINFE::BlasInt,
    NKROL::BlasInt, INFZ::Array{BlasInt,1}, KRONR::Array{BlasInt,1},
    INFE::Array{BlasInt,1}, KRONL::Array{BlasInt,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ag08bd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &EQUIL, &L, &N, &M, &P, A, &LDA, E, &LDE,
            B, &LDB, C, &LDC, D, &LDD, &NFZ, &NRANK, &NIZ, &DINFZ,
            &NKROR, &NINFE, &NKROL, INFZ, KRONR, INFE, KRONL, &TOL,
            IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AG08BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function AG08BY(FIRST::Bool, N::BlasInt, M::BlasInt, P::BlasInt,
    SVLMAX::Float64, ABCD::Array{Float64,1}, LDABCD::Float64,
    E::Array{Float64,1}, LDE::Float64, NR::BlasInt, PR::BlasInt,
    NINFZ::BlasInt, DINFZ::BlasInt, NKRONL::BlasInt,
    INFZ::Array{BlasInt,1}, KRONL::Array{BlasInt,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:ag08by_, "libslicot"), Void, (Ptr{Bool}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &FIRST, &N,
            &M, &P, &SVLMAX, ABCD, &LDABCD, E, &LDE, &NR, &PR,
            &NINFZ, &DINFZ, &NKRONL, INFZ, KRONL, &TOL, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AG08BY: the %dth argument had
        an illegal value", -INFO))
    end
end


function AG08BZ(EQUIL::Char, L::BlasInt, N::BlasInt, M::BlasInt,
    P::BlasInt, A::Array{Complex128,2}, LDA::BlasInt,
    E::Array{Complex128,2}, LDE::BlasInt, B::Array{Complex128,2},
    LDB::BlasInt, C::Array{Complex128,2}, LDC::BlasInt,
    D::Array{Complex128,2}, LDD::BlasInt, NFZ::BlasInt,
    NRANK::BlasInt, NIZ::BlasInt, DINFZ::BlasInt, NKROR::BlasInt,
    NINFE::BlasInt, NKROL::BlasInt, INFZ::Array{BlasInt,1},
    KRONR::Array{BlasInt,1}, INFE::Array{BlasInt,1},
    KRONL::Array{BlasInt,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, ZWORK::Array{Complex128,1},
    LZWORK::BlasInt, INFO::BlasInt)

    ccall((:ag08bz_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{BlasInt}), &EQUIL,
            &L, &N, &M, &P, A, &LDA, E, &LDE, B, &LDB, C, &LDC, D,
            &LDD, &NFZ, &NRANK, &NIZ, &DINFZ, &NKROR, &NINFE,
            &NKROL, INFZ, KRONR, INFE, KRONL, &TOL, IWORK, DWORK,
            ZWORK, &LZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AG08BZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function AG8BYZ(FIRST::Bool, N::BlasInt, M::BlasInt, P::BlasInt,
    SVLMAX::Float64, ABCD::Array{Complex128,1}, LDABCD::Complex128,
    E::Array{Complex128,1}, LDE::Complex128, NR::BlasInt, PR::BlasInt,
    NINFZ::BlasInt, DINFZ::BlasInt, NKRONL::BlasInt,
    INFZ::Array{BlasInt,1}, KRONL::Array{BlasInt,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    ZWORK::Array{Complex128,1}, LZWORK::BlasInt, INFO::BlasInt)

    ccall((:ag8byz_, "libslicot"), Void, (Ptr{Bool}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{BlasInt}), &FIRST,
            &N, &M, &P, &SVLMAX, ABCD, &LDABCD, E, &LDE, &NR, &PR,
            &NINFZ, &DINFZ, &NKRONL, INFZ, KRONL, &TOL, IWORK,
            DWORK, ZWORK, &LZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in AG8BYZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function DE01OD(CONV::Char, N::BlasInt, A::Array{Float64,1},
    B::Array{Float64,1}, INFO::BlasInt)

    ccall((:de01od_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &CONV, &N, A,
            B, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in DE01OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function DE01PD(CONV::Char, WGHT::Char, N::BlasInt,
    A::Array{Float64,1}, B::Array{Float64,1}, W::Array{Float64,1},
    INFO::BlasInt)

    ccall((:de01pd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}), &CONV, &WGHT, &N, A, B, W, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in DE01PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function DF01MD(SICO::Char, N::BlasInt, DT::Float64,
    A::Array{Float64,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:df01md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &SICO, &N, &DT, A, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in DF01MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function DG01MD(INDI::Char, N::BlasInt, XR::Array{Float64,1},
    XI::Array{Float64,1}, INFO::BlasInt)

    ccall((:dg01md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &INDI, &N,
            XR, XI, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in DG01MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function DG01ND(INDI::Char, N::BlasInt, XR::Array{Float64,1},
    XI::Array{Float64,1}, INFO::BlasInt)

    ccall((:dg01nd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &INDI, &N,
            XR, XI, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in DG01ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function DG01NY(INDI::Char, N::BlasInt, XR::Array{Float64,1},
    XI::Array{Float64,1})

    ccall((:dg01ny_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}), &INDI, &N, XR, XI)
    
    if INFO < 0
        error(@sprintf("SlicotError in DG01NY: the %dth argument had
        an illegal value", -INFO))
    end
end


function DG01OD(SCR::Char, WGHT::Char, N::BlasInt,
    A::Array{Float64,1}, W::Array{Float64,1}, INFO::BlasInt)

    ccall((:dg01od_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &SCR, &WGHT, &N, A, W, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in DG01OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function DK01MD(TYPE::Char, N::BlasInt, A::Array{Float64,1},
    INFO::BlasInt)

    ccall((:dk01md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}), &TYPE, &N, A, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in DK01MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function FB01QD(JOBK::Char, MULTBQ::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, S::Array{Float64,2}, LDS::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, K::Array{Float64,2}, LDK::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:fb01qd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOBK, &MULTBQ, &N, &M, &P,
            S, &LDS, A, &LDA, B, &LDB, Q, &LDQ, C, &LDC, R, &LDR, K,
            &LDK, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in FB01QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function FB01RD(JOBK::Char, MULTBQ::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, S::Array{Float64,2}, LDS::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, K::Array{Float64,2}, LDK::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:fb01rd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOBK, &MULTBQ, &N, &M, &P,
            S, &LDS, A, &LDA, B, &LDB, Q, &LDQ, C, &LDC, R, &LDR, K,
            &LDK, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in FB01RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function FB01SD(JOBX::Char, MULTAB::Char, MULTRC::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, SINV::Array{Float64,2}, LDSINV::BlasInt,
    AINV::Array{Float64,2}, LDAINV::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, RINV::Array{Float64,2}, LDRINV::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, QINV::Array{Float64,2},
    LDQINV::BlasInt, X::Array{Float64,1}, RINVY::Array{Float64,1},
    Z::Array{Float64,1}, E::Array{Float64,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:fb01sd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOBX, &MULTAB, &MULTRC, &N, &M, &P,
            SINV, &LDSINV, AINV, &LDAINV, B, &LDB, RINV, &LDRINV, C,
            &LDC, QINV, &LDQINV, X, RINVY, Z, E, &TOL, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in FB01SD: the %dth argument had
        an illegal value", -INFO))
    end
end


function FB01TD(JOBX::Char, MULTRC::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, SINV::Array{Float64,2}, LDSINV::BlasInt,
    AINV::Array{Float64,2}, LDAINV::BlasInt, AINVB::Array{Float64,2},
    LDAINB::BlasInt, RINV::Array{Float64,2}, LDRINV::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, QINV::Array{Float64,2},
    LDQINV::BlasInt, X::Array{Float64,1}, RINVY::Array{Float64,1},
    Z::Array{Float64,1}, E::Array{Float64,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:fb01td_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOBX, &MULTRC, &N, &M, &P, SINV, &LDSINV, AINV,
            &LDAINV, AINVB, &LDAINB, RINV, &LDRINV, C, &LDC, QINV,
            &LDQINV, X, RINVY, Z, E, &TOL, IWORK, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in FB01TD: the %dth argument had
        an illegal value", -INFO))
    end
end


function FB01VD(N::BlasInt, M::BlasInt, L::BlasInt,
    P::Array{Float64,2}, LDP::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, R::Array{Float64,2}, LDR::BlasInt,
    K::Array{Float64,2}, LDK::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:fb01vd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &N, &M, &L, P, &LDP, A, &LDA, B, &LDB, C, &LDC, Q, &LDQ,
            R, &LDR, K, &LDK, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in FB01VD: the %dth argument had
        an illegal value", -INFO))
    end
end


function FD01AD(JP::Char, L::BlasInt, LAMBDA::Float64, XIN::Float64,
    YIN::Float64, EFOR::Float64, XF::Array{Float64,1},
    EPSBCK::Array{Float64,1}, CTETA::Array{Float64,1},
    STETA::Array{Float64,1}, YQ::Array{Float64,1}, EPOS::Float64,
    EOUT::Float64, SALPH::Array{Float64,1}, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:fd01ad_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JP, &L, &LAMBDA, &XIN,
            &YIN, &EFOR, XF, EPSBCK, CTETA, STETA, YQ, &EPOS, &EOUT,
            SALPH, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in FD01AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01AD(METH::Char, ALG::Char, JOBD::Char, BATCH::Char,
    CONCT::Char, CTRL::Char, NOBR::BlasInt, M::BlasInt, L::BlasInt,
    NSMP::BlasInt, U::Array{Float64,1}, LDU::BlasInt,
    Y::Array{Float64,1}, LDY::BlasInt, N::BlasInt,
    R::Array{Float64,1}, LDR::BlasInt, SV::Array{Float64,1},
    RCOND::Float64, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ib01ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &METH, &ALG,
            &JOBD, &BATCH, &CONCT, &CTRL, &NOBR, &M, &L, &NSMP, U,
            &LDU, Y, &LDY, &N, R, &LDR, SV, &RCOND, &TOL, IWORK,
            DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01BD(METH::Char, JOB::Char, JOBCK::Char, NOBR::BlasInt,
    N::BlasInt, M::BlasInt, L::BlasInt, NSMPL::BlasInt,
    R::Array{Float64,1}, LDR::BlasInt, A::Array{Float64,1},
    LDA::BlasInt, C::Array{Float64,1}, LDC::BlasInt,
    B::Array{Float64,1}, LDB::BlasInt, D::Array{Float64,1},
    LDD::BlasInt, Q::Array{Float64,1}, LDQ::BlasInt,
    RY::Array{Float64,1}, LDRY::BlasInt, S::Array{Float64,1},
    LDS::BlasInt, K::Array{Float64,1}, LDK::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    BWORK::Array{Bool,1}, IWARN::BlasInt, INFO::BlasInt)

    ccall((:ib01bd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}, Ptr{BlasInt}), &METH, &JOB,
            &JOBCK, &NOBR, &N, &M, &L, &NSMPL, R, &LDR, A, &LDA, C,
            &LDC, B, &LDB, D, &LDD, Q, &LDQ, RY, &LDRY, S, &LDS, K,
            &LDK, &TOL, IWORK, DWORK, &LDWORK, BWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01CD(JOBX0::Char, COMUSE::Char, JOB::Char, N::BlasInt,
    M::BlasInt, L::BlasInt, NSMP::BlasInt, A::Array{Float64,1},
    LDA::BlasInt, B::Array{Float64,1}, LDB::BlasInt,
    C::Array{Float64,1}, LDC::BlasInt, D::Array{Float64,1},
    LDD::BlasInt, U::Array{Float64,1}, LDU::BlasInt,
    Y::Array{Float64,1}, LDY::BlasInt, X0::Array{Float64,1},
    V::Array{Float64,1}, LDV::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ib01cd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOBX0, &COMUSE, &JOB, &N,
            &M, &L, &NSMP, A, &LDA, B, &LDB, C, &LDC, D, &LDD, U,
            &LDU, Y, &LDY, X0, V, &LDV, &TOL, IWORK, DWORK, &LDWORK,
            &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01CD: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01MD(METH::Char, ALG::Char, BATCH::Char, CONCT::Char,
    NOBR::BlasInt, M::BlasInt, L::BlasInt, NSMP::BlasInt,
    U::Array{Float64,1}, LDU::BlasInt, Y::Array{Float64,1},
    LDY::BlasInt, R::Array{Float64,1}, LDR::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ib01md_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &METH, &ALG, &BATCH, &CONCT, &NOBR, &M,
            &L, &NSMP, U, &LDU, Y, &LDY, R, &LDR, IWORK, DWORK,
            &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01MY(METH::Char, BATCH::Char, CONCT::Char, NOBR::BlasInt,
    M::BlasInt, L::BlasInt, NSMP::BlasInt, U::Array{Float64,1},
    LDU::BlasInt, Y::Array{Float64,1}, LDY::BlasInt,
    R::Array{Float64,1}, LDR::BlasInt, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ib01my_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &METH, &BATCH, &CONCT, &NOBR, &M, &L, &NSMP, U, &LDU, Y,
            &LDY, R, &LDR, IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01MY: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01ND(METH::Char, JOBD::Char, NOBR::BlasInt, M::BlasInt,
    L::BlasInt, R::Array{Float64,1}, LDR::BlasInt,
    SV::Array{Float64,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ib01nd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &METH, &JOBD, &NOBR, &M, &L, R, &LDR, SV, &TOL, IWORK,
            DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01OD(CTRL::Char, NOBR::BlasInt, L::BlasInt,
    SV::Array{Float64,1}, N::BlasInt, TOL::Float64, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ib01od_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &CTRL, &NOBR, &L, SV, &N,
            &TOL, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01OY(NS::BlasInt, NMAX::BlasInt, N::BlasInt,
    SV::Array{Float64,1}, INFO::BlasInt)

    ccall((:ib01oy_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}), &NS, &NMAX,
            &N, SV, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01OY: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01PD(METH::Char, JOB::Char, JOBCV::Char, NOBR::BlasInt,
    N::BlasInt, M::BlasInt, L::BlasInt, NSMPL::BlasInt,
    R::Array{Float64,1}, LDR::BlasInt, A::Array{Float64,1},
    LDA::BlasInt, C::Array{Float64,1}, LDC::BlasInt,
    B::Array{Float64,1}, LDB::BlasInt, D::Array{Float64,1},
    LDD::BlasInt, Q::Array{Float64,1}, LDQ::BlasInt,
    RY::Array{Float64,1}, LDRY::BlasInt, S::Array{Float64,1},
    LDS::BlasInt, O::Array{Float64,1}, LDO::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ib01pd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &METH, &JOB, &JOBCV, &NOBR,
            &N, &M, &L, &NSMPL, R, &LDR, A, &LDA, C, &LDC, B, &LDB,
            D, &LDD, Q, &LDQ, RY, &LDRY, S, &LDS, O, &LDO, &TOL,
            IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01PX(JOB::Char, NOBR::BlasInt, N::BlasInt, M::BlasInt,
    L::BlasInt, UF::Array{Float64,1}, LDUF::BlasInt,
    UN::Array{Float64,1}, LDUN::BlasInt, UL::Array{Float64,1},
    LDUL::BlasInt, PGAL::Array{Float64,1}, LDPGAL::BlasInt,
    K::Array{Float64,1}, LDK::BlasInt, R::Array{Float64,1},
    LDR::BlasInt, X::Array{Float64,1}, B::Array{Float64,1},
    LDB::BlasInt, D::Array{Float64,1}, LDD::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ib01px_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &NOBR, &N, &M, &L,
            UF, &LDUF, UN, &LDUN, UL, &LDUL, PGAL, &LDPGAL, K, &LDK,
            R, &LDR, X, B, &LDB, D, &LDD, &TOL, IWORK, DWORK,
            &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01PX: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01PY(METH::Char, JOB::Char, NOBR::BlasInt, N::BlasInt,
    M::BlasInt, L::BlasInt, RANKR1::BlasInt, UL::Array{Float64,1},
    LDUL::BlasInt, R1::Array{Float64,1}, LDR1::BlasInt,
    TAU1::Array{Float64,1}, PGAL::Array{Float64,1}, LDPGAL::BlasInt,
    K::Array{Float64,1}, LDK::BlasInt, R::Array{Float64,1},
    LDR::BlasInt, H::Array{Float64,1}, LDH::BlasInt,
    B::Array{Float64,1}, LDB::BlasInt, D::Array{Float64,1},
    LDD::BlasInt, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:ib01py_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &METH, &JOB, &NOBR, &N, &M, &L, &RANKR1, UL, &LDUL, R1,
            &LDR1, TAU1, PGAL, &LDPGAL, K, &LDK, R, &LDR, H, &LDH,
            B, &LDB, D, &LDD, &TOL, IWORK, DWORK, &LDWORK, &IWARN,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01PY: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01QD(JOBX0::Char, JOB::Char, N::BlasInt, M::BlasInt,
    L::BlasInt, NSMP::BlasInt, A::Array{Float64,1}, LDA::BlasInt,
    C::Array{Float64,1}, LDC::BlasInt, U::Array{Float64,1},
    LDU::BlasInt, Y::Array{Float64,1}, LDY::BlasInt,
    X0::Array{Float64,1}, B::Array{Float64,1}, LDB::BlasInt,
    D::Array{Float64,1}, LDD::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ib01qd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &JOBX0, &JOB,
            &N, &M, &L, &NSMP, A, &LDA, C, &LDC, U, &LDU, Y, &LDY,
            X0, B, &LDB, D, &LDD, &TOL, IWORK, DWORK, &LDWORK,
            &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB01RD(JOB::Char, N::BlasInt, M::BlasInt, L::BlasInt,
    NSMP::BlasInt, A::Array{Float64,1}, LDA::BlasInt,
    B::Array{Float64,1}, LDB::BlasInt, C::Array{Float64,1},
    LDC::BlasInt, D::Array{Float64,1}, LDD::BlasInt,
    U::Array{Float64,1}, LDU::BlasInt, Y::Array{Float64,1},
    LDY::BlasInt, X0::Array{Float64,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ib01rd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &N, &M, &L, &NSMP, A,
            &LDA, B, &LDB, C, &LDC, D, &LDD, U, &LDU, Y, &LDY, X0,
            &TOL, IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB01RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB03AD(INIT::Char, ALG::Char, STOR::Char, NOBR::BlasInt,
    M::BlasInt, L::BlasInt, NSMP::BlasInt, N::BlasInt, NN::BlasInt,
    ITMAX1::BlasInt, ITMAX2::BlasInt, NPRINT::BlasInt,
    U::Array{Float64,1}, LDU::BlasInt, Y::Array{Float64,1},
    LDY::BlasInt, X::Array{Float64,1}, LX::BlasInt, TOL1::Float64,
    TOL2::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:ib03ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &INIT, &ALG,
            &STOR, &NOBR, &M, &L, &NSMP, &N, &NN, &ITMAX1, &ITMAX2,
            &NPRINT, U, &LDU, Y, &LDY, X, &LX, &TOL1, &TOL2, IWORK,
            DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB03AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function IB03BD(INIT::Char, NOBR::BlasInt, M::BlasInt, L::BlasInt,
    NSMP::BlasInt, N::BlasInt, NN::BlasInt, ITMAX1::BlasInt,
    ITMAX2::BlasInt, NPRINT::BlasInt, U::Array{Float64,1},
    LDU::BlasInt, Y::Array{Float64,1}, LDY::BlasInt,
    X::Array{Float64,1}, LX::BlasInt, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:ib03bd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &INIT, &NOBR, &M, &L, &NSMP, &N, &NN,
            &ITMAX1, &ITMAX2, &NPRINT, U, &LDU, Y, &LDY, X, &LX,
            &TOL1, &TOL2, IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in IB03BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MA01AD(XR::Float64, XI::Float64, YR::Float64, YI::Float64)

    ccall((:ma01ad_, "libslicot"), Void, (Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}), &XR, &XI, &YR, &YI)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA01AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MA01BD(BASE::Float64, LGBAS::Float64, K::BlasInt,
    S::Array{BlasInt,1}, A::Array{Float64,1}, INCA::BlasInt,
    ALPHA::Float64, BETA::Float64, SCAL::BlasInt)

    ccall((:ma01bd_, "libslicot"), Void, (Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &BASE,
            &LGBAS, &K, S, A, &INCA, &ALPHA, &BETA, &SCAL)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA01BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function MA02AD(JOB::Char, M::BlasInt, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt)

    ccall((:ma02ad_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}), &JOB, &M, &N, A, &LDA, B, &LDB)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA02AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MA02BD(SIDE::Char, M::BlasInt, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt)

    ccall((:ma02bd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}), &SIDE, &M,
            &N, A, &LDA)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA02BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MA02BZ(SIDE::Char, M::BlasInt, N::BlasInt,
    A::Array{Complex128,2}, LDA::BlasInt)

    ccall((:ma02bz_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{BlasInt}), &SIDE, &M,
            &N, A, &LDA)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA02BZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function MA02CD(N::BlasInt, KL::BlasInt, KU::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt)

    ccall((:ma02cd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}), &N, &KL, &KU,
            A, &LDA)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA02CD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MA02CZ(N::BlasInt, KL::BlasInt, KU::BlasInt,
    A::Array{Complex128,2}, LDA::BlasInt)

    ccall((:ma02cz_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{BlasInt}), &N, &KL,
            &KU, A, &LDA)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA02CZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function MA02DD(JOB::Char, UPLO::Char, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, AP::Array{Float64,1})

    ccall((:ma02dd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}),
            &JOB, &UPLO, &N, A, &LDA, AP)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA02DD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MA02ED(UPLO::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt)

    ccall((:ma02ed_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}), &UPLO, &N, A, &LDA)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA02ED: the %dth argument had
        an illegal value", -INFO))
    end
end


function MA02FD(X1::Float64, X2::Float64, C::Float64, S::Float64,
    INFO::BlasInt)

    ccall((:ma02fd_, "libslicot"), Void, (Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &X1, &X2, &C,
            &S, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA02FD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MA02GD(N::BlasInt, A::Array{Float64,1}, LDA::Float64,
    K1::BlasInt, K2::BlasInt, IPIV::Array{BlasInt,1}, INCX::BlasInt)

    ccall((:ma02gd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &N, A, &LDA, &K1, &K2, IPIV, &INCX)
    
    if INFO < 0
        error(@sprintf("SlicotError in MA02GD: the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01KD(UPLO::Char, TRANS::Char, N::BlasInt, K::BlasInt,
    ALPHA::Float64, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, BETA::Float64,
    C::Array{Float64,2}, LDC::BlasInt, INFO::BlasInt)

    ccall((:mb01kd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &UPLO,
            &TRANS, &N, &K, &ALPHA, A, &LDA, B, &LDB, &BETA, C,
            &LDC, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01KD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01LD(UPLO::Char, TRANS::Char, M::BlasInt, N::BlasInt,
    ALPHA::Float64, BETA::Float64, R::Array{Float64,2}, LDR::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, X::Array{Float64,2},
    LDX::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb01ld_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &UPLO, &TRANS, &M, &N, &ALPHA, &BETA, R,
            &LDR, A, &LDA, X, &LDX, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01LD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01MD(UPLO::Char, N::BlasInt, ALPHA::Float64,
    A::Array{Float64,2}, LDA::BlasInt, X::Array{Float64,1},
    INCX::BlasInt, BETA::Float64, Y::Array{Float64,1}, INCY::BlasInt)

    ccall((:mb01md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &UPLO, &N, &ALPHA, A, &LDA, X, &INCX, &BETA, Y, &INCY)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01ND(UPLO::Char, N::BlasInt, ALPHA::Float64,
    X::Array{Float64,1}, INCX::BlasInt, Y::Array{Float64,1},
    INCY::BlasInt, A::Array{Float64,1}, LDA::Float64)

    ccall((:mb01nd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}), &UPLO, &N,
            &ALPHA, X, &INCX, Y, &INCY, A, &LDA)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01PD(SCUN::Char, TYPE::Char, M::BlasInt, N::BlasInt,
    KL::BlasInt, KU::BlasInt, ANRM::Float64, NBL::BlasInt,
    NROWS::BlasInt, A::Array{Float64,1}, LDA::Float64, INFO::BlasInt)

    ccall((:mb01pd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &SCUN, &TYPE, &M, &N, &KL,
            &KU, &ANRM, &NBL, &NROWS, A, &LDA, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01QD(TYPE::Char, M::BlasInt, N::BlasInt, KL::BlasInt,
    KU::BlasInt, CFROM::Float64, CTO::Float64, NBL::BlasInt,
    NROWS::BlasInt, A::Array{Float64,1}, LDA::Float64, INFO::BlasInt)

    ccall((:mb01qd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &TYPE, &M, &N, &KL, &KU,
            &CFROM, &CTO, &NBL, &NROWS, A, &LDA, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01RD(UPLO::Char, TRANS::Char, M::BlasInt, N::BlasInt,
    ALPHA::Float64, BETA::Float64, R::Array{Float64,2}, LDR::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, X::Array{Float64,2},
    LDX::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb01rd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &UPLO, &TRANS, &M, &N, &ALPHA, &BETA, R,
            &LDR, A, &LDA, X, &LDX, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01RU(UPLO::Char, TRANS::Char, M::BlasInt, N::BlasInt,
    ALPHA::Float64, BETA::Float64, R::Array{Float64,2}, LDR::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, X::Array{Float64,2},
    LDX::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb01ru_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &UPLO, &TRANS, &M, &N, &ALPHA, &BETA, R,
            &LDR, A, &LDA, X, &LDX, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01RU: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01RW(UPLO::Char, TRANS::Char, M::BlasInt, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, Z::Array{Float64,2},
    LDZ::BlasInt, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb01rw_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &UPLO, &TRANS, &M, &N, A, &LDA, Z, &LDZ, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01RW: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01RX(SIDE::Char, UPLO::Char, TRANS::Char, M::BlasInt,
    N::BlasInt, ALPHA::Float64, BETA::Float64, R::Array{Float64,2},
    LDR::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, INFO::BlasInt)

    ccall((:mb01rx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &SIDE, &UPLO, &TRANS, &M, &N, &ALPHA, &BETA, R, &LDR, A,
            &LDA, B, &LDB, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01RX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01RY(SIDE::Char, UPLO::Char, TRANS::Char, M::BlasInt,
    ALPHA::Float64, BETA::Float64, R::Array{Float64,2}, LDR::BlasInt,
    H::Array{Float64,2}, LDH::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb01ry_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &SIDE, &UPLO, &TRANS, &M, &ALPHA, &BETA, R, &LDR, H,
            &LDH, B, &LDB, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01RY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01SD(JOBS::Char, M::BlasInt, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, R::Array{Float64,1},
    C::Array{Float64,1})

    ccall((:mb01sd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}), &JOBS, &M, &N, A, &LDA, R, C)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01SD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01TD(N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, DWORK::Array{Float64,1},
    INFO::BlasInt)

    ccall((:mb01td_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}), &N, A, &LDA, B, &LDB, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01TD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01UD(SIDE::Char, TRANS::Char, M::BlasInt, N::BlasInt,
    ALPHA::Float64, H::Array{Float64,2}, LDH::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, INFO::BlasInt)

    ccall((:mb01ud_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &SIDE, &TRANS, &M, &N,
            &ALPHA, H, &LDH, A, &LDA, B, &LDB, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01UD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01UW(SIDE::Char, TRANS::Char, M::BlasInt, N::BlasInt,
    ALPHA::Float64, H::Array{Float64,2}, LDH::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb01uw_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &SIDE, &TRANS, &M, &N,
            &ALPHA, H, &LDH, A, &LDA, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01UW: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01UX(SIDE::Char, UPLO::Char, TRANS::Char, M::BlasInt,
    N::BlasInt, ALPHA::Float64, T::Array{Float64,2}, LDT::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb01ux_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &SIDE, &UPLO,
            &TRANS, &M, &N, &ALPHA, T, &LDT, A, &LDA, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01UX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01VD(TRANA::Char, TRANB::Char, MA::BlasInt, NA::BlasInt,
    MB::BlasInt, NB::BlasInt, ALPHA::Float64, BETA::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt, MC::BlasInt,
    NC::BlasInt, INFO::BlasInt)

    ccall((:mb01vd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &TRANA,
            &TRANB, &MA, &NA, &MB, &NB, &ALPHA, &BETA, A, &LDA, B,
            &LDB, C, &LDC, &MC, &NC, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01VD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01WD(DICO::Char, UPLO::Char, TRANS::Char, HESS::Char,
    N::BlasInt, ALPHA::Float64, BETA::Float64, R::Array{Float64,2},
    LDR::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    T::Array{Float64,2}, LDT::BlasInt, INFO::BlasInt)

    ccall((:mb01wd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &DICO, &UPLO, &TRANS, &HESS, &N, &ALPHA, &BETA, R, &LDR,
            A, &LDA, T, &LDT, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01WD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01XD(UPLO::Char, N::BlasInt, A::Array{Float64,1},
    LDA::Float64, INFO::BlasInt)

    ccall((:mb01xd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &UPLO, &N, A,
            &LDA, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01XD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01XY(UPLO::Char, N::BlasInt, A::Array{Float64,1},
    LDA::Float64, INFO::BlasInt)

    ccall((:mb01xy_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &UPLO, &N, A,
            &LDA, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01XY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01YD(UPLO::Char, TRANS::Char, N::BlasInt, K::BlasInt,
    L::BlasInt, ALPHA::Float64, BETA::Float64, A::Array{Float64,1},
    LDA::Float64, C::Array{Float64,1}, LDC::Float64, INFO::BlasInt)

    ccall((:mb01yd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &UPLO, &TRANS, &N, &K, &L,
            &ALPHA, &BETA, A, &LDA, C, &LDC, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01YD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB01ZD(SIDE::Char, UPLO::Char, TRANST::Char, DIAG::Char,
    M::BlasInt, N::BlasInt, L::BlasInt, ALPHA::Float64,
    T::Array{Float64,1}, LDT::Float64, H::Array{Float64,1},
    LDH::Float64, INFO::BlasInt)

    ccall((:mb01zd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &SIDE, &UPLO,
            &TRANST, &DIAG, &M, &N, &L, &ALPHA, T, &LDT, H, &LDH,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB01ZD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02CD(JOB::Char, TYPET::Char, K::BlasInt, N::BlasInt,
    T::Array{Float64,2}, LDT::BlasInt, G::Array{Float64,1},
    LDG::BlasInt, R::Array{Float64,2}, LDR::BlasInt,
    L::Array{Float64,2}, LDL::BlasInt, CS::Array{Float64,1},
    LCS::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb02cd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &TYPET,
            &K, &N, T, &LDT, G, &LDG, R, &LDR, L, &LDL, CS, &LCS,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02CD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02CU(TYPEG::Char, K::BlasInt, P::BlasInt, Q::BlasInt,
    NB::BlasInt, A1::Array{Float64,2}, LDA1::BlasInt,
    A2::Array{Float64,2}, LDA2::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, RNK::BlasInt, IPVT::Array{BlasInt,1},
    CS::Array{Float64,1}, TOL::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb02cu_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &TYPEG, &K, &P, &Q, &NB, A1, &LDA1, A2, &LDA2, B, &LDB,
            &RNK, IPVT, CS, &TOL, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02CU: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02CV(TYPEG::Char, STRUCG::Char, K::BlasInt, N::BlasInt,
    P::BlasInt, Q::BlasInt, NB::BlasInt, RNK::BlasInt,
    A1::Array{Float64,2}, LDA1::BlasInt, A2::Array{Float64,2},
    LDA2::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    F1::Array{Float64,2}, LDF1::BlasInt, F2::Array{Float64,2},
    LDF2::BlasInt, G::Array{Float64,2}, LDG::BlasInt,
    CS::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb02cv_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &TYPEG, &STRUCG, &K, &N,
            &P, &Q, &NB, &RNK, A1, &LDA1, A2, &LDA2, B, &LDB, F1,
            &LDF1, F2, &LDF2, G, &LDG, CS, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02CV: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02CX(TYPET::Char, P::BlasInt, Q::BlasInt, K::BlasInt,
    A::Array{Float64,1}, LDA::BlasInt, B::Array{Float64,1},
    LDB::BlasInt, CS::Array{Float64,1}, LCS::BlasInt,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb02cx_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &TYPET, &P,
            &Q, &K, A, &LDA, B, &LDB, CS, &LCS, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02CX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02CY(TYPET::Char, STRUCG::Char, P::BlasInt, Q::BlasInt,
    N::BlasInt, K::BlasInt, A::Array{Float64,1}, LDA::BlasInt,
    B::Array{Float64,1}, LDB::BlasInt, H::Array{Float64,2},
    LDH::BlasInt, CS::Array{Float64,1}, LCS::BlasInt,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb02cy_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &TYPET,
            &STRUCG, &P, &Q, &N, &K, A, &LDA, B, &LDB, H, &LDH, CS,
            &LCS, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02CY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02DD(JOB::Char, TYPET::Char, K::BlasInt, M::BlasInt,
    N::BlasInt, TA::Array{Float64,2}, LDTA::BlasInt,
    T::Array{Float64,2}, LDT::BlasInt, G::Array{Float64,1},
    LDG::BlasInt, R::Array{Float64,2}, LDR::BlasInt,
    L::Array{Float64,2}, LDL::BlasInt, CS::Array{Float64,1},
    LCS::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb02dd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &TYPET, &K, &M, &N,
            TA, &LDTA, T, &LDT, G, &LDG, R, &LDR, L, &LDL, CS, &LCS,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02DD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02ED(TYPET::Char, K::BlasInt, N::BlasInt, NRHS::BlasInt,
    T::Array{Float64,2}, LDT::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb02ed_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &TYPET, &K, &N, &NRHS, T, &LDT, B, &LDB,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02ED: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02FD(TYPET::Char, K::BlasInt, N::BlasInt, P::BlasInt,
    S::BlasInt, T::Array{Float64,2}, LDT::BlasInt,
    R::Array{Float64,2}, LDR::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb02fd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &TYPET, &K, &N, &P, &S, T,
            &LDT, R, &LDR, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02FD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02GD(TYPET::Char, TRIU::Char, K::BlasInt, N::BlasInt,
    NL::BlasInt, P::BlasInt, S::BlasInt, T::Array{Float64,2},
    LDT::BlasInt, RB::Array{Float64,2}, LDRB::BlasInt,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb02gd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &TYPET, &TRIU, &K, &N, &NL, &P, &S, T, &LDT, RB, &LDRB,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02GD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02HD(TRIU::Char, K::BlasInt, L::BlasInt, M::BlasInt,
    ML::BlasInt, N::BlasInt, NU::BlasInt, P::BlasInt, S::BlasInt,
    TC::Array{Float64,2}, LDTC::BlasInt, TR::Array{Float64,2},
    LDTR::BlasInt, RB::Array{Float64,2}, LDRB::BlasInt,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb02hd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &TRIU, &K, &L, &M, &ML, &N, &NU, &P, &S, TC, &LDTC, TR,
            &LDTR, RB, &LDRB, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02HD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02ID(JOB::Char, K::BlasInt, L::BlasInt, M::BlasInt,
    N::BlasInt, RB::BlasInt, RC::BlasInt, TC::Array{Float64,2},
    LDTC::BlasInt, TR::Array{Float64,2}, LDTR::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb02id_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOB, &K, &L, &M, &N, &RB, &RC, TC, &LDTC, TR, &LDTR, B,
            &LDB, C, &LDC, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02ID: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02JD(JOB::Char, K::BlasInt, L::BlasInt, M::BlasInt,
    N::BlasInt, P::BlasInt, S::BlasInt, TC::Array{Float64,2},
    LDTC::BlasInt, TR::Array{Float64,2}, LDTR::BlasInt,
    Q::Array{Float64,2}, LDQ::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb02jd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOB, &K, &L, &M, &N, &P, &S, TC, &LDTC, TR, &LDTR, Q,
            &LDQ, R, &LDR, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02JD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02JX(JOB::Char, K::BlasInt, L::BlasInt, M::BlasInt,
    N::BlasInt, TC::Array{Float64,2}, LDTC::BlasInt,
    TR::Array{Float64,2}, LDTR::BlasInt, RNK::BlasInt,
    Q::Array{Float64,2}, LDQ::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, JPVT::Array{BlasInt,1}, TOL1::Float64,
    TOL2::Float64, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb02jx_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &K, &L, &M, &N, TC,
            &LDTC, TR, &LDTR, &RNK, Q, &LDQ, R, &LDR, JPVT, &TOL1,
            &TOL2, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02JX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02KD(LDBLK::Char, TRANS::Char, K::BlasInt, L::BlasInt,
    M::BlasInt, N::BlasInt, R::BlasInt, ALPHA::Float64, BETA::Float64,
    TC::Array{Float64,2}, LDTC::BlasInt, TR::Array{Float64,2},
    LDTR::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb02kd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &LDBLK, &TRANS, &K, &L, &M,
            &N, &R, &ALPHA, &BETA, TC, &LDTC, TR, &LDTR, B, &LDB, C,
            &LDC, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02KD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02MD(JOB::Char, M::BlasInt, N::BlasInt, L::BlasInt,
    RANK::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    S::Array{Float64,1}, X::Array{Float64,2}, LDX::BlasInt,
    TOL::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:mb02md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &M, &N, &L, &RANK, C,
            &LDC, S, X, &LDX, &TOL, IWORK, DWORK, &LDWORK, &IWARN,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02ND(M::BlasInt, N::BlasInt, L::BlasInt, RANK::BlasInt,
    THETA::Float64, C::Array{Float64,2}, LDC::BlasInt,
    X::Array{Float64,2}, LDX::BlasInt, Q::Array{Float64,1},
    INUL::Array{Bool,1}, TOL::Float64, RELTOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    BWORK::Array{Bool,1}, IWARN::BlasInt, INFO::BlasInt)

    ccall((:mb02nd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Bool}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Bool}, Ptr{BlasInt},
            Ptr{BlasInt}), &M, &N, &L, &RANK, &THETA, C, &LDC, X,
            &LDX, Q, INUL, &TOL, &RELTOL, IWORK, DWORK, &LDWORK,
            BWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02NY(UPDATU::Bool, UPDATV::Bool, M::BlasInt, N::BlasInt,
    I::BlasInt, K::BlasInt, Q::Array{Float64,1}, E::Array{Float64,1},
    U::Array{Float64,2}, LDU::BlasInt, V::Array{Float64,2},
    LDV::BlasInt, DWORK::Array{Float64,1})

    ccall((:mb02ny_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}), &UPDATU,
            &UPDATV, &M, &N, &I, &K, Q, E, U, &LDU, V, &LDV, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02NY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02OD(SIDE::Char, UPLO::Char, TRANS::Char, DIAG::Char,
    NORM::Char, M::BlasInt, N::BlasInt, ALPHA::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, RCOND::Float64, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb02od_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}), &SIDE, &UPLO,
            &TRANS, &DIAG, &NORM, &M, &N, &ALPHA, A, &LDA, B, &LDB,
            &RCOND, &TOL, IWORK, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02PD(FACT::Char, TRANS::Char, N::BlasInt, NRHS::BlasInt,
    A::Array{Float64,1}, LDA::Float64, AF::Array{Float64,1},
    LDAF::Float64, IPIV::Array{BlasInt,1}, EQUED::Char,
    R::Array{Float64,1}, C::Array{Float64,1}, B::Array{Float64,1},
    LDB::Float64, X::Array{Float64,1}, LDX::Float64, RCOND::Float64,
    FERR::Array{Float64,1}, BERR::Array{Float64,1},
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb02pd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Char},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &FACT, &TRANS, &N, &NRHS, A, &LDA, AF, &LDAF, IPIV,
            &EQUED, R, C, B, &LDB, X, &LDX, &RCOND, FERR, BERR,
            IWORK, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02QD(JOB::Char, INIPER::Char, M::BlasInt, N::BlasInt,
    NRHS::BlasInt, RCOND::Float64, SVLMAX::Float64,
    A::Array{Float64,1}, LDA::Float64, B::Array{Float64,1},
    LDB::Float64, Y::Float64, JPVT::Array{BlasInt,1}, RANK::BlasInt,
    SVAL::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb02qd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOB, &INIPER, &M, &N, &NRHS, &RCOND, &SVLMAX, A, &LDA,
            B, &LDB, &Y, JPVT, &RANK, SVAL, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02QY(M::BlasInt, N::BlasInt, NRHS::BlasInt, RANK::BlasInt,
    A::Array{Float64,1}, LDA::Float64, JPVT::Array{BlasInt,1},
    B::Array{Float64,1}, LDB::Float64, TAU::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb02qy_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &M, &N,
            &NRHS, &RANK, A, &LDA, JPVT, B, &LDB, TAU, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02QY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02RD(TRANS::Char, N::BlasInt, NRHS::BlasInt,
    H::Array{Float64,1}, LDH::Float64, IPIV::Array{BlasInt,1},
    B::Array{Float64,1}, LDB::Float64, INFO::BlasInt)

    ccall((:mb02rd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &TRANS, &N,
            &NRHS, H, &LDH, IPIV, B, &LDB, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02RZ(TRANS::Char, N::BlasInt, NRHS::BlasInt,
    H::Array{Complex128,1}, LDH::Complex128, IPIV::Array{BlasInt,1},
    B::Array{Complex128,1}, LDB::Complex128, INFO::BlasInt)

    ccall((:mb02rz_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{BlasInt}), &TRANS, &N, &NRHS, H, &LDH, IPIV, B,
            &LDB, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02RZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02SD(N::BlasInt, H::Array{Float64,2}, LDH::BlasInt,
    IPIV::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:mb02sd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &N, H, &LDH,
            IPIV, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02SD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02SZ(N::BlasInt, H::Array{Complex128,2}, LDH::BlasInt,
    IPIV::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:mb02sz_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &N, H, &LDH,
            IPIV, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02SZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02TD(NORM::Char, N::BlasInt, HNORM::Float64,
    H::Array{Float64,1}, LDH::Float64, IPIV::Array{BlasInt,1},
    RCOND::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    INFO::BlasInt)

    ccall((:mb02td_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &NORM, &N, &HNORM, H, &LDH, IPIV, &RCOND, IWORK, DWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02TD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02TZ(NORM::Char, N::BlasInt, HNORM::Float64,
    H::Array{Complex128,1}, LDH::Complex128, IPIV::Array{BlasInt,1},
    RCOND::Float64, DWORK::Array{Float64,1},
    ZWORK::Array{Complex128,1}, INFO::BlasInt)

    ccall((:mb02tz_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Complex128}, Ptr{BlasInt}), &NORM, &N, &HNORM, H,
            &LDH, IPIV, &RCOND, DWORK, ZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02TZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02UD(FACT::Char, SIDE::Char, TRANS::Char, JOBP::Char,
    M::BlasInt, N::BlasInt, ALPHA::Float64, RCOND::Float64,
    RANK::BlasInt, R::Array{Float64,2}, LDR::BlasInt,
    Q::Array{Float64,2}, LDQ::BlasInt, SV::Array{Float64,1},
    B::Array{Float64,2}, LDB::BlasInt, RP::Array{Float64,2},
    LDRP::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb02ud_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &FACT, &SIDE,
            &TRANS, &JOBP, &M, &N, &ALPHA, &RCOND, &RANK, R, &LDR,
            Q, &LDQ, SV, B, &LDB, RP, &LDRP, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02UD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02UU(N::BlasInt, A::Array{Float64,1}, LDA::Float64,
    RHS::Array{Float64,1}, IPIV::Array{BlasInt,1},
    JPIV::Array{BlasInt,1}, SCALE::Float64)

    ccall((:mb02uu_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}), &N, A, &LDA, RHS, IPIV, JPIV, &SCALE)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02UU: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02UV(N::BlasInt, A::Array{Float64,1}, LDA::Float64,
    IPIV::Array{BlasInt,1}, JPIV::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:mb02uv_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &N, A, &LDA, IPIV, JPIV, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02UV: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02UW(LTRANS::Bool, N::BlasInt, M::BlasInt,
    PAR::Array{Float64,1}, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, SCALE::Float64, IWARN::BlasInt)

    ccall((:mb02uw_, "libslicot"), Void, (Ptr{Bool}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &LTRANS, &N, &M, PAR, A, &LDA, B, &LDB, &SCALE, &IWARN)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02UW: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02VD(TRANS::Char, M::BlasInt, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, IPIV::Array{BlasInt,1},
    B::Array{Float64,1}, LDB::Float64, INFO::BlasInt)

    ccall((:mb02vd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &TRANS, &M,
            &N, A, &LDA, IPIV, B, &LDB, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02VD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB02YD(COND::Char, N::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, IPVT::Array{BlasInt,1}, DIAG::Array{Float64,1},
    QTB::Array{Float64,1}, RANK::BlasInt, X::Array{Float64,1},
    TOL::Float64, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb02yd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &COND, &N, R,
            &LDR, IPVT, DIAG, QTB, &RANK, X, &TOL, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB02YD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03AD(SHFT::Char, K::BlasInt, N::BlasInt,
    AMAP::Array{BlasInt,1}, S::Array{BlasInt,1}, SINV::BlasInt,
    A::Array{Float64,3}, LDA1::BlasInt, LDA2::BlasInt, C1::Float64,
    S1::Float64, C2::Float64, S2::Float64)

    ccall((:mb03ad_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}), &SHFT, &K,
            &N, AMAP, S, &SINV, A, &LDA1, &LDA2, &C1, &S1, &C2, &S2)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03BA(K::BlasInt, H::BlasInt, S::Array{BlasInt,1},
    SMULT::BlasInt, AMAP::Array{BlasInt,1}, QMAP::Array{BlasInt,1})

    ccall((:mb03ba_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &K, &H, S, &SMULT, AMAP, QMAP)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03BA: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03BB(BASE::Float64, LGBAS::Float64, ULP::Float64,
    K::BlasInt, AMAP::Array{BlasInt,1}, S::Array{BlasInt,1},
    SINV::BlasInt, A::Array{Float64,3}, LDA1::BlasInt, LDA2::BlasInt,
    ALPHAR::Array{Float64,1}, ALPHAI::Array{Float64,1},
    BETA::Array{Float64,1}, SCAL::Array{BlasInt,1},
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb03bb_, "libslicot"), Void, (Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}), &BASE, &LGBAS, &ULP, &K,
            AMAP, S, &SINV, A, &LDA1, &LDA2, ALPHAR, ALPHAI, BETA,
            SCAL, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03BB: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03BC(K::BlasInt, AMAP::Array{BlasInt,1},
    S::Array{BlasInt,1}, SINV::BlasInt, A::Array{Float64,3},
    LDA1::BlasInt, LDA2::BlasInt, MACPAR::Array{Float64,1},
    CV::Array{Float64,1}, SV::Array{Float64,1},
    DWORK::Array{Float64,1})

    ccall((:mb03bc_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}), &K, AMAP, S, &SINV, A, &LDA1, &LDA2,
            MACPAR, CV, SV, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03BC: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03BD(JOB::Char, DEFL::Char, COMPQ::Char,
    QIND::Array{BlasInt,1}, K::BlasInt, N::BlasInt, H::BlasInt,
    ILO::BlasInt, IHI::BlasInt, S::Array{BlasInt,1},
    A::Array{Float64,3}, LDA1::BlasInt, LDA2::BlasInt,
    Q::Array{Float64,3}, LDQ1::BlasInt, LDQ2::BlasInt,
    ALPHAR::Array{Float64,1}, ALPHAI::Array{Float64,1},
    BETA::Array{Float64,1}, SCAL::Array{BlasInt,1},
    IWORK::Array{BlasInt,1}, LIWORK::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:mb03bd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOB, &DEFL, &COMPQ, QIND, &K, &N, &H, &ILO, &IHI, S, A,
            &LDA1, &LDA2, Q, &LDQ1, &LDQ2, ALPHAR, ALPHAI, BETA,
            SCAL, IWORK, &LIWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03BE(K::BlasInt, AMAP::Array{BlasInt,1},
    S::Array{BlasInt,1}, SINV::BlasInt, A::Array{Float64,3},
    LDA1::BlasInt, LDA2::BlasInt)

    ccall((:mb03be_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &K, AMAP, S, &SINV, A, &LDA1, &LDA2)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03BE: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03CD(UPLO::Char, N1::BlasInt, N2::BlasInt, PREC::Float64,
    A::Array{Float64,1}, LDA::Float64, B::Array{Float64,1},
    LDB::Float64, D::Array{Float64,1}, LDD::Float64,
    Q1::Array{Float64,1}, LDQ1::Float64, Q2::Array{Float64,1},
    LDQ2::Float64, Q3::Array{Float64,1}, LDQ3::Float64,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03cd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &UPLO, &N1, &N2, &PREC, A, &LDA, B, &LDB,
            D, &LDD, Q1, &LDQ1, Q2, &LDQ2, Q3, &LDQ3, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03CD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03DD(UPLO::Char, N1::BlasInt, N2::BlasInt, PREC::Float64,
    A::Array{Float64,1}, LDA::Float64, B::Array{Float64,1},
    LDB::Float64, Q1::Array{Float64,1}, LDQ1::Float64,
    Q2::Array{Float64,1}, LDQ2::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03dd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &UPLO, &N1, &N2, &PREC, A, &LDA, B, &LDB,
            Q1, &LDQ1, Q2, &LDQ2, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03DD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03ED(N::BlasInt, PREC::Float64, A::Array{Float64,1},
    LDA::Float64, B::Array{Float64,1}, LDB::Float64,
    D::Array{Float64,1}, LDD::Float64, Q1::Array{Float64,1},
    LDQ1::Float64, Q2::Array{Float64,1}, LDQ2::Float64,
    Q3::Array{Float64,1}, LDQ3::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03ed_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, &PREC, A,
            &LDA, B, &LDB, D, &LDD, Q1, &LDQ1, Q2, &LDQ2, Q3, &LDQ3,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03ED: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03FD(N::BlasInt, PREC::Float64, A::Array{Float64,1},
    LDA::Float64, B::Array{Float64,1}, LDB::Float64,
    Q1::Array{Float64,1}, LDQ1::Float64, Q2::Array{Float64,1},
    LDQ2::Float64, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb03fd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, &PREC, A,
            &LDA, B, &LDB, Q1, &LDQ1, Q2, &LDQ2, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03FD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03GD(N::BlasInt, B::Array{Float64,1}, LDB::Float64,
    D::Array{Float64,1}, LDD::Float64, MACPAR::Array{Float64,1},
    Q::Array{Float64,1}, LDQ::Float64, U::Array{Float64,1},
    LDU::Float64, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb03gd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, B, &LDB,
            D, &LDD, MACPAR, Q, &LDQ, U, &LDU, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03GD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03HD(N::BlasInt, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, MACPAR::Array{Float64,1},
    Q::Array{Float64,1}, LDQ::Float64, DWORK::Array{Float64,1},
    INFO::BlasInt)

    ccall((:mb03hd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &N, A, &LDA, B, &LDB, MACPAR, Q, &LDQ, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03HD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03ID(COMPQ::Char, COMPU::Char, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    B::Array{Float64,1}, LDB::Float64, F::Array{Float64,1},
    LDF::Float64, Q::Array{Float64,1}, LDQ::Float64,
    U1::Array{Float64,1}, LDU1::Float64, U2::Array{Float64,1},
    LDU2::Float64, NEIG::BlasInt, IWORK::Array{BlasInt,1},
    LIWORK::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb03id_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &COMPQ,
            &COMPU, &N, A, &LDA, C, &LDC, D, &LDD, B, &LDB, F, &LDF,
            Q, &LDQ, U1, &LDU1, U2, &LDU2, &NEIG, IWORK, &LIWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03ID: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03JD(COMPQ::Char, N::BlasInt, A::Array{Float64,1},
    LDA::Float64, D::Array{Float64,1}, LDD::Float64,
    B::Array{Float64,1}, LDB::Float64, F::Array{Float64,1},
    LDF::Float64, Q::Array{Float64,1}, LDQ::Float64, NEIG::BlasInt,
    IWORK::Array{BlasInt,1}, LIWORK::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03jd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &COMPQ, &N, A, &LDA, D, &LDD, B, &LDB, F, &LDF, Q, &LDQ,
            &NEIG, IWORK, &LIWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03JD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03KA(COMPQ::Char, WHICHQ::Array{BlasInt,1}, WS::Bool,
    K::BlasInt, NC::BlasInt, KSCHUR::BlasInt, IFST::BlasInt,
    ILST::BlasInt, N::Array{BlasInt,1}, NI::Array{BlasInt,1},
    S::Array{BlasInt,1}, T::Array{Float64,1}, LDT::Array{BlasInt,1},
    IXT::Array{BlasInt,1}, Q::Array{Float64,1}, LDQ::Array{BlasInt,1},
    IXQ::Array{BlasInt,1}, TOL::Array{Float64,1},
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb03ka_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &COMPQ, WHICHQ, &WS, &K, &NC, &KSCHUR, &IFST, &ILST, N,
            NI, S, T, LDT, IXT, Q, LDQ, IXQ, TOL, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03KA: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03KB(COMPQ::Char, WHICHQ::Array{BlasInt,1}, WS::Bool,
    K::BlasInt, NC::BlasInt, KSCHUR::BlasInt, J1::BlasInt,
    N1::BlasInt, N2::BlasInt, N::Array{BlasInt,1},
    NI::Array{BlasInt,1}, S::Array{BlasInt,1}, T::Array{Float64,1},
    LDT::Array{BlasInt,1}, IXT::Array{BlasInt,1}, Q::Array{Float64,1},
    LDQ::Array{BlasInt,1}, IXQ::Array{BlasInt,1},
    TOL::Array{Float64,1}, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03kb_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &COMPQ, WHICHQ, &WS, &K, &NC, &KSCHUR,
            &J1, &N1, &N2, N, NI, S, T, LDT, IXT, Q, LDQ, IXQ, TOL,
            IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03KB: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03KC(K::BlasInt, KHESS::BlasInt, N::BlasInt, R::BlasInt,
    S::Array{BlasInt,1}, A::Array{Float64,1}, LDA::BlasInt,
    V::Array{Float64,1}, TAU::Array{Float64,1})

    ccall((:mb03kc_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}), &K, &KHESS,
            &N, &R, S, A, &LDA, V, TAU)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03KC: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03KD(COMPQ::Char, WHICHQ::Array{BlasInt,1}, STRONG::Char,
    K::BlasInt, NC::BlasInt, KSCHUR::BlasInt, N::Array{BlasInt,1},
    NI::Array{BlasInt,1}, S::Array{BlasInt,1}, SELECT::Array{Bool,1},
    T::Array{Float64,1}, LDT::Array{BlasInt,1}, IXT::Array{BlasInt,1},
    Q::Array{Float64,1}, LDQ::Array{BlasInt,1}, IXQ::Array{BlasInt,1},
    M::BlasInt, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03kd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Bool},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &COMPQ, WHICHQ, &STRONG, &K, &NC, &KSCHUR, N, NI, S,
            SELECT, T, LDT, IXT, Q, LDQ, IXQ, &M, &TOL, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03KD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03KE(TRANA::Bool, TRANB::Bool, ISGN::BlasInt, K::BlasInt,
    M::BlasInt, N::BlasInt, PREC::Float64, SMIN::Float64,
    S::Array{BlasInt,1}, A::Array{Float64,1}, B::Array{Float64,1},
    C::Array{Float64,1}, SCALE::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03ke_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &TRANA, &TRANB, &ISGN, &K,
            &M, &N, &PREC, &SMIN, S, A, B, C, &SCALE, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03KE: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03LD(COMPQ::Char, ORTH::Char, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, DE::Array{Float64,1},
    LDDE::Float64, B::Array{Float64,1}, LDB::Float64,
    FG::Array{Float64,1}, LDFG::Float64, NEIG::BlasInt,
    Q::Array{Float64,1}, LDQ::Float64, ALPHAR::Array{Float64,1},
    ALPHAI::Array{Float64,1}, BETA::Array{Float64,1},
    BWORK::Array{Bool,1}, IWORK::Array{BlasInt,1}, LIWORK::BlasInt,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03ld_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &COMPQ, &ORTH, &N, A, &LDA, DE, &LDDE, B,
            &LDB, FG, &LDFG, &NEIG, Q, &LDQ, ALPHAR, ALPHAI, BETA,
            BWORK, IWORK, &LIWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03LD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03MD(N::BlasInt, L::BlasInt, THETA::Float64,
    Q::Array{Float64,1}, E::Array{Float64,1}, Q2::Array{Float64,1},
    E2::Array{Float64,1}, PIVMIN::Float64, TOL::Float64,
    RELTOL::Float64, IWARN::BlasInt, INFO::BlasInt)

    ccall((:mb03md_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &L, &THETA, Q, E, Q2,
            E2, &PIVMIN, &TOL, &RELTOL, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03OD(JOBQR::Char, M::BlasInt, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, JPVT::Array{BlasInt,1},
    RCOND::Float64, SVLMAX::Float64, TAU::Array{Float64,1},
    RANK::BlasInt, SVAL::Array{Float64,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03od_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOBQR, &M, &N, A, &LDA, JPVT, &RCOND, &SVLMAX, TAU,
            &RANK, SVAL, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03OY(M::BlasInt, N::BlasInt, A::Array{Float64,1},
    LDA::Float64, RCOND::Float64, SVLMAX::Float64, RANK::BlasInt,
    SVAL::Array{Float64,1}, JPVT::Array{BlasInt,1},
    TAU::Array{Float64,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb03oy_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &M, &N, A, &LDA, &RCOND,
            &SVLMAX, &RANK, SVAL, JPVT, TAU, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03OY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03PD(JOBRQ::Char, M::BlasInt, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, JPVT::Array{BlasInt,1},
    RCOND::Float64, SVLMAX::Float64, TAU::Array{Float64,1},
    RANK::BlasInt, SVAL::Array{Float64,1}, DWORK::Array{Float64,1},
    INFO::BlasInt)

    ccall((:mb03pd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &JOBRQ, &M,
            &N, A, &LDA, JPVT, &RCOND, &SVLMAX, TAU, &RANK, SVAL,
            DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03PY(M::BlasInt, N::BlasInt, A::Array{Float64,1},
    LDA::Float64, RCOND::Float64, SVLMAX::Float64, RANK::BlasInt,
    SVAL::Array{Float64,1}, JPVT::Array{BlasInt,1},
    TAU::Array{Float64,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb03py_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &M, &N, A, &LDA, &RCOND,
            &SVLMAX, &RANK, SVAL, JPVT, TAU, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03PY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03QD(DICO::Char, STDOM::Char, JOBU::Char, N::BlasInt,
    NLOW::BlasInt, NSUP::BlasInt, ALPHA::Float64, A::Array{Float64,2},
    LDA::BlasInt, U::Array{Float64,2}, LDU::BlasInt, NDIM::BlasInt,
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb03qd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &DICO, &STDOM, &JOBU, &N, &NLOW, &NSUP, &ALPHA, A, &LDA,
            U, &LDU, &NDIM, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03QX(N::BlasInt, T::Array{Float64,1}, LDT::BlasInt,
    WR::Array{Float64,1}, WI::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb03qx_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &N, T, &LDT, WR, WI, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03QX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03QY(N::BlasInt, L::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, U::Array{Float64,2}, LDU::BlasInt, E1::Float64,
    E2::Float64, INFO::BlasInt)

    ccall((:mb03qy_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &N, &L, A,
            &LDA, U, &LDU, &E1, &E2, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03QY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03RD(JOBX::Char, SORT::Char, N::BlasInt, PMAX::Float64,
    A::Array{Float64,2}, LDA::BlasInt, X::Array{Float64,2},
    LDX::BlasInt, NBLCKS::BlasInt, BLSIZE::Array{BlasInt,1},
    WR::Array{Float64,1}, WI::Array{Float64,1}, TOL::Float64,
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb03rd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}), &JOBX, &SORT, &N, &PMAX, A, &LDA, X,
            &LDX, &NBLCKS, BLSIZE, WR, WI, &TOL, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03RX(JOBV::Char, N::BlasInt, KL::BlasInt, KU::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, X::Array{Float64,2},
    LDX::BlasInt, WR::Array{Float64,1}, WI::Array{Float64,1},
    DWORK::Array{Float64,1})

    ccall((:mb03rx_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}), &JOBV, &N, &KL, &KU, A, &LDA, X, &LDX,
            WR, WI, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03RX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03RY(M::BlasInt, N::BlasInt, PMAX::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt, INFO::BlasInt)

    ccall((:mb03ry_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &M, &N, &PMAX, A, &LDA, B, &LDB, C, &LDC, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03RY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03SD(JOBSCL::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, QG::Array{Float64,2}, LDQG::BlasInt,
    WR::Array{Float64,1}, WI::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03sd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOBSCL, &N, A, &LDA, QG, &LDQG, WR, WI,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03SD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03TD(TYP::Char, COMPU::Char, SELECT::Array{Bool,1},
    LOWER::Array{Bool,1}, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, G::Array{Float64,2}, LDG::BlasInt,
    U1::Array{Float64,2}, LDU1::BlasInt, U2::Array{Float64,2},
    LDU2::BlasInt, WR::Array{Float64,1}, WI::Array{Float64,1},
    M::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb03td_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Bool}, Ptr{Bool}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &TYP, &COMPU, SELECT, LOWER, &N, A, &LDA,
            G, &LDG, U1, &LDU1, U2, &LDU2, WR, WI, &M, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03TD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03TS(ISHAM::Bool, WANTU::Bool, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, G::Array{Float64,2},
    LDG::BlasInt, U1::Array{Float64,2}, LDU1::BlasInt,
    U2::Array{Float64,2}, LDU2::BlasInt, J1::BlasInt, N1::BlasInt,
    N2::BlasInt, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb03ts_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}), &ISHAM, &WANTU, &N, A,
            &LDA, G, &LDG, U1, &LDU1, U2, &LDU2, &J1, &N1, &N2,
            DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03TS: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03UD(JOBQ::Char, JOBP::Char, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, SV::Array{Float64,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03ud_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOBQ, &JOBP, &N, A, &LDA, Q, &LDQ, SV,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03UD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03VD(N::BlasInt, P::BlasInt, ILO::BlasInt, IHI::BlasInt,
    A::Array{Float64,1}, LDA1::Float64, LDA2::Float64,
    TAU::Array{Float64,1}, LDTAU::Float64, DWORK::Array{Float64,1},
    INFO::BlasInt)

    ccall((:mb03vd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}), &N, &P, &ILO, &IHI, A, &LDA1, &LDA2, TAU,
            &LDTAU, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03VD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03VY(N::BlasInt, P::BlasInt, ILO::BlasInt, IHI::BlasInt,
    A::Array{Float64,1}, LDA1::Float64, LDA2::Float64,
    TAU::Array{Float64,1}, LDTAU::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03vy_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &P, &ILO, &IHI, A,
            &LDA1, &LDA2, TAU, &LDTAU, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03VY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03WA(WANTQ::Bool, WANTZ::Bool, N1::BlasInt, N2::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    Z::Array{Float64,2}, LDZ::BlasInt, INFO::BlasInt)

    ccall((:mb03wa_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &WANTQ,
            &WANTZ, &N1, &N2, A, &LDA, B, &LDB, Q, &LDQ, Z, &LDZ,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03WA: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03WD(JOB::Char, COMPZ::Char, N::BlasInt, P::BlasInt,
    ILO::BlasInt, IHI::BlasInt, ILOZ::BlasInt, IHIZ::BlasInt,
    H::Array{Float64,1}, LDH1::Float64, LDH2::Float64,
    Z::Array{Float64,1}, LDZ1::Float64, LDZ2::Float64,
    WR::Array{Float64,1}, WI::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03wd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOB, &COMPZ, &N, &P, &ILO, &IHI, &ILOZ,
            &IHIZ, H, &LDH1, &LDH2, Z, &LDZ1, &LDZ2, WR, WI, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03WD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03WX(N::BlasInt, P::BlasInt, T::Array{Float64,1},
    LDT1::Float64, LDT2::Float64, WR::Array{Float64,1},
    WI::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb03wx_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &N, &P, T, &LDT1, &LDT2,
            WR, WI, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03WX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03XD(BALANC::Char, JOB::Char, JOBU::Char, JOBV::Char,
    N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    QG::Array{Float64,2}, LDQG::BlasInt, T::Array{Float64,2},
    LDT::BlasInt, U1::Array{Float64,2}, LDU1::BlasInt,
    U2::Array{Float64,2}, LDU2::BlasInt, V1::Array{Float64,2},
    LDV1::BlasInt, V2::Array{Float64,2}, LDV2::BlasInt,
    WR::Array{Float64,1}, WI::Array{Float64,1}, ILO::BlasInt,
    SCALE::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb03xd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &BALANC, &JOB, &JOBU, &JOBV, &N, A, &LDA, QG, &LDQG, T,
            &LDT, U1, &LDU1, U2, &LDU2, V1, &LDV1, V2, &LDV2, WR,
            WI, &ILO, SCALE, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03XD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03XP(JOB::Char, COMPQ::Char, COMPZ::Char, N::BlasInt,
    ILO::BlasInt, IHI::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, Z::Array{Float64,2}, LDZ::BlasInt,
    ALPHAR::Array{Float64,1}, ALPHAI::Array{Float64,1},
    BETA::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb03xp_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &COMPQ, &COMPZ, &N,
            &ILO, &IHI, A, &LDA, B, &LDB, Q, &LDQ, Z, &LDZ, ALPHAR,
            ALPHAI, BETA, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03XP: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03XU(LTRA::Bool, LTRB::Bool, N::BlasInt, K::BlasInt,
    NB::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, G::Array{Float64,2},
    LDG::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    XA::Array{Float64,2}, LDXA::BlasInt, XB::Array{Float64,2},
    LDXB::BlasInt, XG::Array{Float64,2}, LDXG::BlasInt,
    XQ::Array{Float64,2}, LDXQ::BlasInt, YA::Array{Float64,2},
    LDYA::BlasInt, YB::Array{Float64,2}, LDYB::BlasInt,
    YG::Array{Float64,2}, LDYG::BlasInt, YQ::Array{Float64,2},
    LDYQ::BlasInt, CSL::Array{Float64,1}, CSR::Array{Float64,1},
    TAUL::Array{Float64,1}, TAUR::Array{Float64,1},
    DWORK::Array{Float64,1})

    ccall((:mb03xu_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}),
            &LTRA, &LTRB, &N, &K, &NB, A, &LDA, B, &LDB, G, &LDG, Q,
            &LDQ, XA, &LDXA, XB, &LDXB, XG, &LDXG, XQ, &LDXQ, YA,
            &LDYA, YB, &LDYB, YG, &LDYG, YQ, &LDYQ, CSL, CSR, TAUL,
            TAUR, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03XU: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03YA(WANTT::Bool, WANTQ::Bool, WANTZ::Bool, N::BlasInt,
    ILO::BlasInt, IHI::BlasInt, ILOQ::BlasInt, IHIQ::BlasInt,
    POS::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, Z::Array{Float64,2}, LDZ::BlasInt, INFO::BlasInt)

    ccall((:mb03ya_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{Bool}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &WANTT, &WANTQ, &WANTZ, &N, &ILO, &IHI, &ILOQ, &IHIQ,
            &POS, A, &LDA, B, &LDB, Q, &LDQ, Z, &LDZ, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03YA: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03YD(WANTT::Bool, WANTQ::Bool, WANTZ::Bool, N::BlasInt,
    ILO::BlasInt, IHI::BlasInt, ILOQ::BlasInt, IHIQ::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    Z::Array{Float64,2}, LDZ::BlasInt, ALPHAR::Array{Float64,1},
    ALPHAI::Array{Float64,1}, BETA::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb03yd_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{Bool}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &WANTT, &WANTQ, &WANTZ, &N, &ILO, &IHI, &ILOQ, &IHIQ, A,
            &LDA, B, &LDB, Q, &LDQ, Z, &LDZ, ALPHAR, ALPHAI, BETA,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03YD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03YT(A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, ALPHAR::Array{Float64,1},
    ALPHAI::Array{Float64,1}, BETA::Array{Float64,1}, CSL::Float64,
    SNL::Float64, CSR::Float64, SNR::Float64)

    ccall((:mb03yt_, "libslicot"), Void, (Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}), A, &LDA, B, &LDB, ALPHAR, ALPHAI, BETA,
            &CSL, &SNL, &CSR, &SNR)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03YT: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03ZA(COMPC::Char, COMPU::Char, COMPV::Char, COMPW::Char,
    WHICH::Char, SELECT::Array{Bool,1}, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    U1::Array{Float64,2}, LDU1::BlasInt, U2::Array{Float64,2},
    LDU2::BlasInt, V1::Array{Float64,2}, LDV1::BlasInt,
    V2::Array{Float64,2}, LDV2::BlasInt, W::Array{Float64,2},
    LDW::BlasInt, WR::Array{Float64,1}, WI::Array{Float64,1},
    M::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb03za_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &COMPC,
            &COMPU, &COMPV, &COMPW, &WHICH, SELECT, &N, A, &LDA, B,
            &LDB, C, &LDC, U1, &LDU1, U2, &LDU2, V1, &LDV1, V2,
            &LDV2, W, &LDW, WR, WI, &M, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03ZA: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB03ZD(WHICH::Char, METH::Char, STAB::Char, BALANC::Char,
    ORTBAL::Char, SELECT::Array{Bool,1}, N::BlasInt, MM::BlasInt,
    ILO::BlasInt, SCALE::Array{Float64,1}, S::Array{Float64,2},
    LDS::BlasInt, T::Array{Float64,2}, LDT::BlasInt,
    G::Array{Float64,2}, LDG::BlasInt, U1::Array{Float64,2},
    LDU1::BlasInt, U2::Array{Float64,2}, LDU2::BlasInt,
    V1::Array{Float64,2}, LDV1::BlasInt, V2::Array{Float64,2},
    LDV2::BlasInt, M::BlasInt, WR::Array{Float64,1},
    WI::Array{Float64,1}, US::Array{Float64,2}, LDUS::BlasInt,
    UU::Array{Float64,2}, LDUU::BlasInt, LWORK::Array{Bool,1},
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb03zd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Bool}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &WHICH, &METH, &STAB,
            &BALANC, &ORTBAL, SELECT, &N, &MM, &ILO, SCALE, S, &LDS,
            T, &LDT, G, &LDG, U1, &LDU1, U2, &LDU2, V1, &LDV1, V2,
            &LDV2, &M, WR, WI, US, &LDUS, UU, &LDUU, LWORK, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB03ZD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04AD(JOB::Char, COMPQ1::Char, COMPQ2::Char, COMPU1::Char,
    COMPU2::Char, N::BlasInt, Z::Array{Float64,1}, LDZ::Float64,
    H::Array{Float64,1}, LDH::Float64, T::Array{Float64,1},
    LDT::Float64, Q1::Array{Float64,1}, LDQ1::Float64,
    Q2::Array{Float64,1}, LDQ2::Float64, U11::Array{Float64,1},
    LDU11::Float64, U12::Array{Float64,1}, LDU12::Float64,
    U21::Array{Float64,1}, LDU21::Float64, U22::Array{Float64,1},
    LDU22::Float64, ALPHAR::Array{Float64,1},
    ALPHAI::Array{Float64,1}, BETA::Array{Float64,1},
    IWORK::Array{BlasInt,1}, LIWORK::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &COMPQ1, &COMPQ2,
            &COMPU1, &COMPU2, &N, Z, &LDZ, H, &LDH, T, &LDT, Q1,
            &LDQ1, Q2, &LDQ2, U11, &LDU11, U12, &LDU12, U21, &LDU21,
            U22, &LDU22, ALPHAR, ALPHAI, BETA, IWORK, &LIWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04BD(JOB::Char, COMPQ1::Char, COMPQ2::Char, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, DE::Array{Float64,1},
    LDDE::Float64, C1::Array{Float64,1}, LDC1::Float64,
    VW::Array{Float64,1}, LDVW::Float64, Q1::Array{Float64,1},
    LDQ1::Float64, Q2::Array{Float64,1}, LDQ2::Float64,
    B::Array{Float64,1}, LDB::Float64, F::Array{Float64,1},
    LDF::Float64, C2::Array{Float64,1}, LDC2::Float64,
    ALPHAR::Array{Float64,1}, ALPHAI::Array{Float64,1},
    BETA::Array{Float64,1}, IWORK::Array{BlasInt,1}, LIWORK::BlasInt,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04bd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOB, &COMPQ1, &COMPQ2, &N, A, &LDA, DE, &LDDE, C1,
            &LDC1, VW, &LDVW, Q1, &LDQ1, Q2, &LDQ2, B, &LDB, F,
            &LDF, C2, &LDC2, ALPHAR, ALPHAI, BETA, IWORK, &LIWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04DD(JOB::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, QG::Array{Float64,2}, LDQG::BlasInt, ILO::BlasInt,
    SCALE::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb04dd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}), &JOB, &N, A,
            &LDA, QG, &LDQG, &ILO, SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04DD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04DI(JOB::Char, SGN::Char, N::BlasInt, ILO::BlasInt,
    SCALE::Array{Float64,1}, M::BlasInt, V1::Array{Float64,2},
    LDV1::BlasInt, V2::Array{Float64,2}, LDV2::BlasInt, INFO::BlasInt)

    ccall((:mb04di_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOB, &SGN, &N, &ILO, SCALE, &M, V1,
            &LDV1, V2, &LDV2, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04DI: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04DS(JOB::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, QG::Array{Float64,2}, LDQG::BlasInt, ILO::BlasInt,
    SCALE::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb04ds_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}), &JOB, &N, A,
            &LDA, QG, &LDQG, &ILO, SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04DS: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04DY(JOBSCL::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, QG::Array{Float64,2}, LDQG::BlasInt,
    D::Array{Float64,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb04dy_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &JOBSCL, &N,
            A, &LDA, QG, &LDQG, D, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04DY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04GD(M::BlasInt, N::BlasInt, A::Array{Float64,1},
    LDA::Float64, JPVT::Array{BlasInt,1}, TAU::Array{Float64,1},
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb04gd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &M, &N, A, &LDA, JPVT, TAU,
            DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04GD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04HD(COMPQ1::Char, COMPQ2::Char, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, B::Array{Float64,1},
    LDB::Float64, Q1::Array{Float64,1}, LDQ1::Float64,
    Q2::Array{Float64,1}, LDQ2::Float64, BWORK::Array{Bool,1},
    IWORK::Array{BlasInt,1}, LIWORK::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04hd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Bool}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &COMPQ1,
            &COMPQ2, &N, A, &LDA, B, &LDB, Q1, &LDQ1, Q2, &LDQ2,
            BWORK, IWORK, &LIWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04HD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04ID(N::BlasInt, M::BlasInt, P::BlasInt, L::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, TAU::Array{Float64,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04id_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &P, &L, A, &LDA, B,
            &LDB, TAU, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04ID: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04IY(SIDE::Char, TRANS::Char, N::BlasInt, M::BlasInt,
    K::BlasInt, P::BlasInt, A::Array{Float64,1}, LDA::Float64,
    TAU::Array{Float64,1}, C::Array{Float64,1}, LDC::Float64,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04iy_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &SIDE, &TRANS, &N, &M, &K, &P, A, &LDA, TAU, C, &LDC,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04IY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04IZ(N::BlasInt, M::BlasInt, P::BlasInt, L::BlasInt,
    A::Array{Complex128,2}, LDA::BlasInt, B::Array{Complex128,2},
    LDB::BlasInt, TAU::Array{Complex128,1},
    ZWORK::Array{Complex128,1}, LZWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04iz_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{BlasInt}), &N, &M, &P, &L, A, &LDA, B, &LDB, TAU,
            ZWORK, &LZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04IZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04JD(N::BlasInt, M::BlasInt, P::BlasInt, L::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, TAU::Array{Float64,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04jd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &P, &L, A, &LDA, B,
            &LDB, TAU, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04JD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04KD(UPLO::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    R::Array{Float64,2}, LDR::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, TAU::Array{Float64,1},
    DWORK::Array{Float64,1})

    ccall((:mb04kd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}),
            &UPLO, &N, &M, &P, R, &LDR, A, &LDA, B, &LDB, C, &LDC,
            TAU, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04KD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04LD(UPLO::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    L::Array{Float64,2}, LDL::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, TAU::Array{Float64,1},
    DWORK::Array{Float64,1})

    ccall((:mb04ld_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}),
            &UPLO, &N, &M, &P, L, &LDL, A, &LDA, B, &LDB, C, &LDC,
            TAU, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04LD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04MD(N::BlasInt, MAXRED::Float64, A::Array{Float64,1},
    LDA::Float64, SCALE::Array{Float64,1}, INFO::BlasInt)

    ccall((:mb04md_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &N, &MAXRED, A, &LDA, SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04ND(UPLO::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    R::Array{Float64,2}, LDR::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, TAU::Array{Float64,1},
    DWORK::Array{Float64,1})

    ccall((:mb04nd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}),
            &UPLO, &N, &M, &P, R, &LDR, A, &LDA, B, &LDB, C, &LDC,
            TAU, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04NY(M::BlasInt, N::BlasInt, V::Array{Float64,1},
    INCV::BlasInt, TAU::Float64, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, DWORK::Array{Float64,1})

    ccall((:mb04ny_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}),
            &M, &N, V, &INCV, &TAU, A, &LDA, B, &LDB, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04NY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04OD(UPLO::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    R::Array{Float64,2}, LDR::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, TAU::Array{Float64,1},
    DWORK::Array{Float64,1})

    ccall((:mb04od_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}),
            &UPLO, &N, &M, &P, R, &LDR, A, &LDA, B, &LDB, C, &LDC,
            TAU, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04OW(M::BlasInt, N::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, T::Array{Float64,2},
    LDT::BlasInt, X::Array{Float64,1}, INCX::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,1}, INCD::BlasInt)

    ccall((:mb04ow_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}), &M, &N, &P, A, &LDA, T, &LDT, X, &INCX,
            B, &LDB, C, &LDC, D, &INCD)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04OW: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04OX(N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    X::Array{Float64,1}, INCX::BlasInt)

    ccall((:mb04ox_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}), &N, A, &LDA,
            X, &INCX)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04OX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04OY(M::BlasInt, N::BlasInt, V::Array{Float64,1},
    TAU::Float64, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, DWORK::Array{Float64,1})

    ccall((:mb04oy_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}), &M, &N, V,
            &TAU, A, &LDA, B, &LDB, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04OY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04PA(LHAM::Bool, N::BlasInt, K::BlasInt, NB::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, QG::Array{Float64,2},
    LDQG::BlasInt, XA::Array{Float64,2}, LDXA::BlasInt,
    XG::Array{Float64,2}, LDXG::BlasInt, XQ::Array{Float64,2},
    LDXQ::BlasInt, YA::Array{Float64,2}, LDYA::BlasInt,
    CS::Array{Float64,1}, TAU::Array{Float64,1},
    DWORK::Array{Float64,1})

    ccall((:mb04pa_, "libslicot"), Void, (Ptr{Bool}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}), &LHAM, &N, &K, &NB, A, &LDA, QG, &LDQG,
            XA, &LDXA, XG, &LDXG, XQ, &LDXQ, YA, &LDYA, CS, TAU,
            DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04PA: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04PB(N::BlasInt, ILO::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, QG::Array{Float64,2}, LDQG::BlasInt,
    CS::Array{Float64,1}, TAU::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04pb_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &N, &ILO, A, &LDA, QG, &LDQG, CS, TAU,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04PB: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04PU(N::BlasInt, ILO::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, QG::Array{Float64,2}, LDQG::BlasInt,
    CS::Array{Float64,1}, TAU::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04pu_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &N, &ILO, A, &LDA, QG, &LDQG, CS, TAU,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04PU: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04PY(SIDE::Char, M::BlasInt, N::BlasInt,
    V::Array{Float64,1}, TAU::Float64, C::Array{Float64,1},
    LDC::Float64, DWORK::Array{Float64,1})

    ccall((:mb04py_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}), &SIDE, &M, &N, V, &TAU, C,
            &LDC, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04PY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04QB(TRANC::Char, TRAND::Char, TRANQ::Char, STOREV::Char,
    STOREW::Char, M::BlasInt, N::BlasInt, K::BlasInt,
    V::Array{Float64,2}, LDV::BlasInt, W::Array{Float64,2},
    LDW::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, CS::Array{Float64,1},
    TAU::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb04qb_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &TRANC,
            &TRAND, &TRANQ, &STOREV, &STOREW, &M, &N, &K, V, &LDV,
            W, &LDW, C, &LDC, D, &LDD, CS, TAU, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04QB: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04QC(STRUCT::Char, TRANA::Char, TRANB::Char, TRANQ::Char,
    DIRECT::Char, STOREV::Char, STOREW::Char, M::BlasInt, N::BlasInt,
    K::BlasInt, V::Array{Float64,2}, LDV::BlasInt,
    W::Array{Float64,2}, LDW::BlasInt, RS::Array{Float64,2},
    LDRS::BlasInt, T::Array{Float64,2}, LDT::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, DWORK::Array{Float64,1})

    ccall((:mb04qc_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}),
            &STRUCT, &TRANA, &TRANB, &TRANQ, &DIRECT, &STOREV,
            &STOREW, &M, &N, &K, V, &LDV, W, &LDW, RS, &LDRS, T,
            &LDT, A, &LDA, B, &LDB, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04QC: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04QF(DIRECT::Char, STOREV::Char, STOREW::Char, N::BlasInt,
    K::BlasInt, V::Array{Float64,2}, LDV::BlasInt,
    W::Array{Float64,2}, LDW::BlasInt, CS::Array{Float64,1},
    TAU::Array{Float64,1}, RS::Array{Float64,2}, LDRS::BlasInt,
    T::Array{Float64,2}, LDT::BlasInt, DWORK::Array{Float64,1})

    ccall((:mb04qf_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}), &DIRECT, &STOREV, &STOREW,
            &N, &K, V, &LDV, W, &LDW, CS, TAU, RS, &LDRS, T, &LDT,
            DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04QF: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04QU(TRANC::Char, TRAND::Char, TRANQ::Char, STOREV::Char,
    STOREW::Char, M::BlasInt, N::BlasInt, K::BlasInt,
    V::Array{Float64,2}, LDV::BlasInt, W::Array{Float64,2},
    LDW::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, CS::Array{Float64,1},
    TAU::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb04qu_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &TRANC,
            &TRAND, &TRANQ, &STOREV, &STOREW, &M, &N, &K, V, &LDV,
            W, &LDW, C, &LDC, D, &LDD, CS, TAU, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04QU: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04SU(M::BlasInt, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    CS::Array{Float64,1}, TAU::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04su_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &M, &N, A, &LDA, B, &LDB, CS, TAU, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04SU: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04TB(TRANA::Char, TRANB::Char, N::BlasInt, ILO::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, G::Array{Float64,2}, LDG::BlasInt,
    Q::Array{Float64,2}, LDQ::BlasInt, CSL::Array{Float64,1},
    CSR::Array{Float64,1}, TAUL::Array{Float64,1},
    TAUR::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb04tb_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &TRANA, &TRANB, &N, &ILO, A, &LDA, B,
            &LDB, G, &LDG, Q, &LDQ, CSL, CSR, TAUL, TAUR, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04TB: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04TS(TRANA::Char, TRANB::Char, N::BlasInt, ILO::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, G::Array{Float64,2}, LDG::BlasInt,
    Q::Array{Float64,2}, LDQ::BlasInt, CSL::Array{Float64,1},
    CSR::Array{Float64,1}, TAUL::Array{Float64,1},
    TAUR::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb04ts_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &TRANA, &TRANB, &N, &ILO, A, &LDA, B,
            &LDB, G, &LDG, Q, &LDQ, CSL, CSR, TAUL, TAUR, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04TS: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04TT(UPDATQ::Bool, UPDATZ::Bool, M::BlasInt, N::BlasInt,
    IFIRA::BlasInt, IFICA::BlasInt, NCA::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, E::Array{Float64,2}, LDE::BlasInt,
    Q::Array{Float64,2}, LDQ::BlasInt, Z::Array{Float64,2},
    LDZ::BlasInt, ISTAIR::Array{BlasInt,1}, RANK::BlasInt,
    TOL::Float64, IWORK::Array{BlasInt,1})

    ccall((:mb04tt_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}), &UPDATQ, &UPDATZ, &M, &N, &IFIRA, &IFICA,
            &NCA, A, &LDA, E, &LDE, Q, &LDQ, Z, &LDZ, ISTAIR, &RANK,
            &TOL, IWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04TT: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04TU(N::BlasInt, X::Array{Float64,1}, INCX::BlasInt,
    Y::Array{Float64,1}, INCY::BlasInt, C::Float64, S::Float64)

    ccall((:mb04tu_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}), &N, X, &INCX, Y, &INCY, &C, &S)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04TU: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04TV(UPDATZ::Bool, N::BlasInt, NRA::BlasInt, NCA::BlasInt,
    IFIRA::BlasInt, IFICA::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    E::Array{Float64,2}, LDE::BlasInt, Z::Array{Float64,2},
    LDZ::BlasInt)

    ccall((:mb04tv_, "libslicot"), Void, (Ptr{Bool}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}), &UPDATZ, &N, &NRA, &NCA,
            &IFIRA, &IFICA, A, &LDA, E, &LDE, Z, &LDZ)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04TV: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04TW(UPDATQ::Bool, M::BlasInt, N::BlasInt, NRE::BlasInt,
    NCE::BlasInt, IFIRE::BlasInt, IFICE::BlasInt, IFICA::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, E::Array{Float64,2},
    LDE::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt)

    ccall((:mb04tw_, "libslicot"), Void, (Ptr{Bool}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &UPDATQ, &M, &N, &NRE, &NCE, &IFIRE, &IFICE, &IFICA, A,
            &LDA, E, &LDE, Q, &LDQ)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04TW: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04TX(UPDATQ::Bool, UPDATZ::Bool, M::BlasInt, N::BlasInt,
    NBLCKS::BlasInt, INUK::Array{BlasInt,1}, IMUK::Array{BlasInt,1},
    A::Array{Float64,2}, LDA::BlasInt, E::Array{Float64,2},
    LDE::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    Z::Array{Float64,2}, LDZ::BlasInt, MNEI::Array{BlasInt,1})

    ccall((:mb04tx_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &UPDATQ, &UPDATZ, &M, &N,
            &NBLCKS, INUK, IMUK, A, &LDA, E, &LDE, Q, &LDQ, Z, &LDZ,
            MNEI)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04TX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04TY(UPDATQ::Bool, UPDATZ::Bool, M::BlasInt, N::BlasInt,
    NBLCKS::BlasInt, INUK::Array{BlasInt,1}, IMUK::Array{BlasInt,1},
    A::Array{Float64,2}, LDA::BlasInt, E::Array{Float64,2},
    LDE::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    Z::Array{Float64,2}, LDZ::BlasInt, INFO::BlasInt)

    ccall((:mb04ty_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &UPDATQ, &UPDATZ, &M, &N,
            &NBLCKS, INUK, IMUK, A, &LDA, E, &LDE, Q, &LDQ, Z, &LDZ,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04TY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04UD(JOBQ::Char, JOBZ::Char, M::BlasInt, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, E::Array{Float64,2},
    LDE::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    Z::Array{Float64,2}, LDZ::BlasInt, RANKE::BlasInt,
    ISTAIR::Array{BlasInt,1}, TOL::Float64, DWORK::Array{Float64,1},
    INFO::BlasInt)

    ccall((:mb04ud_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &JOBQ, &JOBZ,
            &M, &N, A, &LDA, E, &LDE, Q, &LDQ, Z, &LDZ, &RANKE,
            ISTAIR, &TOL, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04UD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04VD(MODE::Char, JOBQ::Char, JOBZ::Char, M::BlasInt,
    N::BlasInt, RANKE::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    E::Array{Float64,2}, LDE::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, Z::Array{Float64,2}, LDZ::BlasInt,
    ISTAIR::Array{BlasInt,1}, NBLCKS::BlasInt, NBLCKI::BlasInt,
    IMUK::Array{BlasInt,1}, INUK::Array{BlasInt,1},
    IMUK0::Array{BlasInt,1}, MNEI::Array{BlasInt,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:mb04vd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &MODE, &JOBQ, &JOBZ, &M,
            &N, &RANKE, A, &LDA, E, &LDE, Q, &LDQ, Z, &LDZ, ISTAIR,
            &NBLCKS, &NBLCKI, IMUK, INUK, IMUK0, MNEI, &TOL, IWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04VD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04VX(UPDATQ::Bool, UPDATZ::Bool, M::BlasInt, N::BlasInt,
    NBLCKS::BlasInt, INUK::Array{BlasInt,1}, IMUK::Array{BlasInt,1},
    A::Array{Float64,2}, LDA::BlasInt, E::Array{Float64,2},
    LDE::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    Z::Array{Float64,2}, LDZ::BlasInt, MNEI::Array{BlasInt,1})

    ccall((:mb04vx_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &UPDATQ, &UPDATZ, &M, &N,
            &NBLCKS, INUK, IMUK, A, &LDA, E, &LDE, Q, &LDQ, Z, &LDZ,
            MNEI)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04VX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04WD(TRANQ1::Char, TRANQ2::Char, M::BlasInt, N::BlasInt,
    K::BlasInt, Q1::Array{Float64,2}, LDQ1::BlasInt,
    Q2::Array{Float64,2}, LDQ2::BlasInt, CS::Array{Float64,1},
    TAU::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb04wd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &TRANQ1, &TRANQ2, &M, &N, &K, Q1, &LDQ1, Q2, &LDQ2, CS,
            TAU, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04WD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04WP(N::BlasInt, ILO::BlasInt, U1::Array{Float64,2},
    LDU1::BlasInt, U2::Array{Float64,2}, LDU2::BlasInt,
    CS::Array{Float64,1}, TAU::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04wp_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &N, &ILO, U1, &LDU1, U2, &LDU2, CS, TAU,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04WP: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04WR(JOB::Char, TRANS::Char, N::BlasInt, ILO::BlasInt,
    Q1::Array{Float64,2}, LDQ1::BlasInt, Q2::Array{Float64,2},
    LDQ2::BlasInt, CS::Array{Float64,1}, TAU::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mb04wr_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &TRANS,
            &N, &ILO, Q1, &LDQ1, Q2, &LDQ2, CS, TAU, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04WR: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04WU(TRANQ1::Char, TRANQ2::Char, M::BlasInt, N::BlasInt,
    K::BlasInt, Q1::Array{Float64,2}, LDQ1::BlasInt,
    Q2::Array{Float64,2}, LDQ2::BlasInt, CS::Array{Float64,1},
    TAU::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb04wu_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &TRANQ1, &TRANQ2, &M, &N, &K, Q1, &LDQ1, Q2, &LDQ2, CS,
            TAU, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04WU: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04XD(JOBU::Char, JOBV::Char, M::BlasInt, N::BlasInt,
    RANK::BlasInt, THETA::Float64, A::Array{Float64,2}, LDA::BlasInt,
    U::Array{Float64,2}, LDU::BlasInt, V::Array{Float64,2},
    LDV::BlasInt, Q::Array{Float64,1}, INUL::Array{Bool,1},
    TOL::Float64, RELTOL::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:mb04xd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Bool},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOBU, &JOBV, &M, &N,
            &RANK, &THETA, A, &LDA, U, &LDU, V, &LDV, Q, INUL, &TOL,
            &RELTOL, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04XD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04XY(JOBU::Char, JOBV::Char, M::BlasInt, N::BlasInt,
    X::Array{Float64,2}, LDX::BlasInt, TAUP::Array{Float64,1},
    TAUQ::Array{Float64,1}, U::Array{Float64,2}, LDU::BlasInt,
    V::Array{Float64,2}, LDV::BlasInt, INUL::Array{Bool,1},
    INFO::BlasInt)

    ccall((:mb04xy_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Bool}, Ptr{BlasInt}),
            &JOBU, &JOBV, &M, &N, X, &LDX, TAUP, TAUQ, U, &LDU, V,
            &LDV, INUL, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04XY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04YD(JOBU::Char, JOBV::Char, M::BlasInt, N::BlasInt,
    RANK::BlasInt, THETA::Float64, Q::Array{Float64,1},
    E::Array{Float64,1}, U::Array{Float64,2}, LDU::BlasInt,
    V::Array{Float64,2}, LDV::BlasInt, INUL::Array{Bool,1},
    TOL::Float64, RELTOL::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:mb04yd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Bool}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOBU, &JOBV, &M, &N, &RANK, &THETA, Q,
            E, U, &LDU, V, &LDV, INUL, &TOL, &RELTOL, DWORK,
            &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04YD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04YW(QRIT::Bool, UPDATU::Bool, UPDATV::Bool, M::BlasInt,
    N::BlasInt, L::BlasInt, K::BlasInt, SHIFT::Float64,
    D::Array{Float64,1}, E::Array{Float64,1}, U::Array{Float64,1},
    LDU::Float64, V::Array{Float64,1}, LDV::Float64,
    DWORK::Array{Float64,1})

    ccall((:mb04yw_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{Bool}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}), &QRIT, &UPDATU, &UPDATV, &M, &N, &L, &K,
            &SHIFT, D, E, U, &LDU, V, &LDV, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04YW: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB04ZD(COMPU::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, QG::Array{Float64,2}, LDQG::BlasInt,
    U::Array{Float64,2}, LDU::BlasInt, DWORK::Array{Float64,1},
    INFO::BlasInt)

    ccall((:mb04zd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &COMPU, &N, A, &LDA, QG, &LDQG, U, &LDU, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB04ZD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB05MD(BALANC::Char, N::BlasInt, DELTA::Float64,
    A::Array{Float64,2}, LDA::BlasInt, V::Array{Float64,2},
    LDV::BlasInt, Y::Array{Float64,2}, LDY::BlasInt,
    VALR::Array{Float64,1}, VALI::Array{Float64,1},
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb05md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &BALANC, &N, &DELTA, A, &LDA, V, &LDV, Y,
            &LDY, VALR, VALI, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB05MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB05MY(BALANC::Char, N::BlasInt, A::Array{Float64,1},
    LDA::Float64, WR::Array{Float64,1}, WI::Array{Float64,1},
    R::Array{Float64,1}, LDR::Float64, Q::Array{Float64,1},
    LDQ::Float64, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb05my_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &BALANC, &N,
            A, &LDA, WR, WI, R, &LDR, Q, &LDQ, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB05MY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB05ND(N::BlasInt, DELTA::Float64, A::Array{Float64,2},
    LDA::BlasInt, EX::Array{Float64,2}, LDEX::BlasInt,
    EXINT::Array{Float64,2}, LDEXIN::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:mb05nd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, &DELTA,
            A, &LDA, EX, &LDEX, EXINT, &LDEXIN, &TOL, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB05ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB05OD(BALANC::Char, N::BlasInt, NDIAG::BlasInt,
    DELTA::Float64, A::Array{Float64,2}, LDA::BlasInt, MDIG::BlasInt,
    IDIG::BlasInt, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:mb05od_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &BALANC, &N,
            &NDIAG, &DELTA, A, &LDA, &MDIG, &IDIG, IWORK, DWORK,
            &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB05OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB05OY(JOB::Char, N::BlasInt, LOW::BlasInt, IGH::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, SCALE::Array{Float64,1},
    INFO::BlasInt)

    ccall((:mb05oy_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}), &JOB, &N, &LOW, &IGH, A,
            &LDA, SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB05OY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB3OYZ(M::BlasInt, N::BlasInt, A::Array{Complex128,1},
    LDA::Complex128, RCOND::Float64, SVLMAX::Float64, RANK::BlasInt,
    SVAL::Array{Float64,1}, JPVT::Array{BlasInt,1},
    TAU::Array{Complex128,1}, DWORK::Array{Float64,1},
    ZWORK::Array{Complex128,1}, INFO::BlasInt)

    ccall((:mb3oyz_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{Float64}, Ptr{Complex128},
            Ptr{BlasInt}), &M, &N, A, &LDA, &RCOND, &SVLMAX, &RANK,
            SVAL, JPVT, TAU, DWORK, ZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB3OYZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function MB3PYZ(M::BlasInt, N::BlasInt, A::Array{Complex128,1},
    LDA::Complex128, RCOND::Float64, SVLMAX::Float64, RANK::BlasInt,
    SVAL::Array{Float64,1}, JPVT::Array{BlasInt,1},
    TAU::Array{Complex128,1}, DWORK::Array{Float64,1},
    ZWORK::Array{Complex128,1}, INFO::BlasInt)

    ccall((:mb3pyz_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{Float64}, Ptr{Complex128},
            Ptr{BlasInt}), &M, &N, A, &LDA, &RCOND, &SVLMAX, &RANK,
            SVAL, JPVT, TAU, DWORK, ZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MB3PYZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01MD(DP::BlasInt, ALPHA::Float64, K::BlasInt,
    P::Array{Float64,1}, Q::Array{Float64,1}, INFO::BlasInt)

    ccall((:mc01md_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &DP, &ALPHA, &K, P, Q, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01ND(DP::BlasInt, XR::Float64, XI::Float64,
    P::Array{Float64,1}, VR::Float64, VI::Float64, INFO::BlasInt)

    ccall((:mc01nd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}), &DP, &XR, &XI, P, &VR, &VI, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01OD(K::BlasInt, REZ::Array{Float64,1},
    IMZ::Array{Float64,1}, REP::Array{Float64,1},
    IMP::Array{Float64,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mc01od_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}), &K, REZ, IMZ, REP, IMP, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01PD(K::BlasInt, REZ::Array{Float64,1},
    IMZ::Array{Float64,1}, P::Array{Float64,1},
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mc01pd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &K, REZ, IMZ, P, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01PY(K::BlasInt, REZ::Array{Float64,1},
    IMZ::Array{Float64,1}, P::Array{Float64,1},
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mc01py_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &K, REZ, IMZ, P, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01PY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01QD(DA::BlasInt, DB::BlasInt, A::Array{Float64,1},
    B::Array{Float64,1}, RQ::Array{Float64,1}, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:mc01qd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &DA, &DB, A, B, RQ, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01RD(DP1::BlasInt, DP2::BlasInt, DP3::BlasInt,
    ALPHA::Float64, P1::Array{Float64,1}, P2::Array{Float64,1},
    P3::Array{Float64,1}, INFO::BlasInt)

    ccall((:mc01rd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &DP1, &DP2, &DP3, &ALPHA,
            P1, P2, P3, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01SD(DP::BlasInt, P::Array{Float64,1}, S::BlasInt,
    T::BlasInt, MANT::Array{Float64,1}, E::Array{BlasInt,1},
    IWORK::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:mc01sd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &DP, P, &S, &T, MANT, E,
            IWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01SD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01SW(A::Float64, B::BlasInt, M::Float64, E::BlasInt)

    ccall((:mc01sw_, "libslicot"), Void, (Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}), &A, &B, &M, &E)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01SW: the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01SY(M::Float64, E::BlasInt, B::BlasInt, A::Float64,
    OVFLOW::Bool)

    ccall((:mc01sy_, "libslicot"), Void, (Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Bool}), &M, &E, &B, &A,
            &OVFLOW)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01SY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01TD(DICO::Char, DP::BlasInt, P::Array{Float64,1},
    STABLE::Bool, NZ::BlasInt, DWORK::Array{Float64,1},
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:mc01td_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Bool}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &DP, P, &STABLE,
            &NZ, DWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01TD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01VD(A::Float64, B::Float64, C::Float64, Z1RE::Float64,
    Z1IM::Float64, Z2RE::Float64, Z2IM::Float64, INFO::BlasInt)

    ccall((:mc01vd_, "libslicot"), Void, (Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &A, &B, &C, &Z1RE, &Z1IM,
            &Z2RE, &Z2IM, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01VD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC01WD(DP::BlasInt, P::Array{Float64,1}, U1::Float64,
    U2::Float64, Q::Array{Float64,1}, INFO::BlasInt)

    ccall((:mc01wd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &DP, P, &U1, &U2, Q, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC01WD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC03MD(RP1::BlasInt, CP1::BlasInt, CP2::BlasInt,
    DP1::BlasInt, DP2::BlasInt, DP3::BlasInt, ALPHA::Float64,
    P1::Array{Float64,3}, LDP11::BlasInt, LDP12::BlasInt,
    P2::Array{Float64,3}, LDP21::BlasInt, LDP22::BlasInt,
    P3::Array{Float64,3}, LDP31::BlasInt, LDP32::BlasInt,
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:mc03md_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &RP1, &CP1, &CP2, &DP1, &DP2, &DP3, &ALPHA, P1, &LDP11,
            &LDP12, P2, &LDP21, &LDP22, P3, &LDP31, &LDP32, DWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC03MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC03ND(MP::BlasInt, NP::BlasInt, DP::BlasInt,
    P::Array{Float64,3}, LDP1::BlasInt, LDP2::BlasInt, DK::BlasInt,
    GAM::Array{BlasInt,1}, NULLSP::Array{Float64,2}, LDNULL::BlasInt,
    KER::Array{Float64,3}, LDKER1::BlasInt, LDKER2::BlasInt,
    TOL::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:mc03nd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &MP, &NP, &DP, P, &LDP1, &LDP2, &DK, GAM, NULLSP,
            &LDNULL, KER, &LDKER1, &LDKER2, &TOL, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC03ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC03NX(MP::BlasInt, NP::BlasInt, DP::BlasInt,
    P::Array{Float64,3}, LDP1::BlasInt, LDP2::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, E::Array{Float64,2},
    LDE::BlasInt)

    ccall((:mc03nx_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &MP, &NP, &DP, P, &LDP1, &LDP2, A, &LDA, E, &LDE)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC03NX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MC03NY(NBLCKS::BlasInt, NRA::BlasInt, NCA::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, E::Array{Float64,2},
    LDE::BlasInt, IMUK::Array{BlasInt,1}, INUK::Array{BlasInt,1},
    VEPS::Array{Float64,2}, LDVEPS::BlasInt, INFO::BlasInt)

    ccall((:mc03ny_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &NBLCKS, &NRA, &NCA, A,
            &LDA, E, &LDE, IMUK, INUK, VEPS, &LDVEPS, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MC03NY: the %dth argument had
        an illegal value", -INFO))
    end
end


function MD03BA(N::BlasInt, IPAR::Array{BlasInt,1}, LIPAR::BlasInt,
    FNORM::Float64, J::Array{Float64,1}, LDJ::BlasInt,
    E::Array{Float64,1}, JNORMS::Array{Float64,1}, GNORM::Float64,
    IPVT::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:md03ba_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, IPAR,
            &LIPAR, &FNORM, J, &LDJ, E, JNORMS, &GNORM, IPVT, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MD03BA: the %dth argument had
        an illegal value", -INFO))
    end
end


function MD03BB(COND::Char, N::BlasInt, IPAR::Array{BlasInt,1},
    LIPAR::BlasInt, R::Array{Float64,2}, LDR::BlasInt,
    IPVT::Array{BlasInt,1}, DIAG::Array{Float64,1},
    QTB::Array{Float64,1}, DELTA::Float64, PAR::Float64,
    RANKS::Array{BlasInt,1}, X::Array{Float64,1},
    RX::Array{Float64,1}, TOL::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:md03bb_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &COND, &N, IPAR, &LIPAR, R, &LDR, IPVT, DIAG, QTB,
            &DELTA, &PAR, RANKS, X, RX, &TOL, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MD03BB: the %dth argument had
        an illegal value", -INFO))
    end
end


function MD03BF(IFLAG::BlasInt, M::BlasInt, N::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, DPAR1::Array{Float64,1},
    LDPAR1::BlasInt, DPAR2::Array{Float64,1}, LDPAR2::BlasInt,
    X::Array{Float64,1}, NFEVL::BlasInt, E::Array{Float64,1},
    J::Array{Float64,2}, LDJ::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:md03bf_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &IFLAG, &M,
            &N, IPAR, &LIPAR, DPAR1, &LDPAR1, DPAR2, &LDPAR2, X,
            &NFEVL, E, J, &LDJ, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MD03BF: the %dth argument had
        an illegal value", -INFO))
    end
end


function MD03BX(M::BlasInt, N::BlasInt, FNORM::Float64,
    J::Array{Float64,1}, LDJ::BlasInt, E::Array{Float64,1},
    JNORMS::Array{Float64,1}, GNORM::Float64, IPVT::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:md03bx_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &M, &N, &FNORM, J, &LDJ, E,
            JNORMS, &GNORM, IPVT, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MD03BX: the %dth argument had
        an illegal value", -INFO))
    end
end


function MD03BY(COND::Char, N::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, IPVT::Array{BlasInt,1}, DIAG::Array{Float64,1},
    QTB::Array{Float64,1}, DELTA::Float64, PAR::Float64,
    RANK::BlasInt, X::Array{Float64,1}, RX::Array{Float64,1},
    TOL::Float64, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:md03by_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &COND, &N, R, &LDR, IPVT,
            DIAG, QTB, &DELTA, &PAR, &RANK, X, RX, &TOL, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in MD03BY: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01AD(NSMP::BlasInt, M::BlasInt, L::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, X::Array{Float64,1},
    LX::BlasInt, U::Array{Float64,2}, LDU::BlasInt,
    Y::Array{Float64,2}, LDY::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01ad_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &NSMP, &M, &L, IPAR, &LIPAR, X, &LX, U, &LDU, Y, &LDY,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01AY(NSMP::BlasInt, NZ::BlasInt, L::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, WB::Array{Float64,1},
    LWB::BlasInt, Z::Array{Float64,2}, LDZ::BlasInt,
    Y::Array{Float64,2}, LDY::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01ay_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &NSMP, &NZ, &L, IPAR, &LIPAR, WB, &LWB, Z, &LDZ, Y,
            &LDY, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01AY: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BA(IFLAG::BlasInt, NSMP::BlasInt, N::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, Z::Array{Float64,2},
    LDZ::BlasInt, Y::Array{Float64,2}, LDY::BlasInt,
    X::Array{Float64,1}, NFEVL::BlasInt, E::Array{Float64,1},
    J::Array{Float64,2}, LDJ::BlasInt, JTE::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01ba_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &IFLAG, &NSMP, &N, IPAR, &LIPAR, Z, &LDZ, Y, &LDY, X,
            &NFEVL, E, J, &LDJ, JTE, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BA: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BB(IFLAG::BlasInt, NFUN::BlasInt, LX::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, U::Array{Float64,2},
    LDU::BlasInt, Y::Array{Float64,2}, LDY::BlasInt,
    X::Array{Float64,1}, NFEVL::BlasInt, E::Array{Float64,1},
    J::Array{Float64,2}, LDJ::BlasInt, JTE::Array{Float64,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01bb_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &IFLAG, &NFUN, &LX, IPAR, &LIPAR, U, &LDU, Y, &LDY, X,
            &NFEVL, E, J, &LDJ, JTE, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BB: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BD(CJTE::Char, NSMP::BlasInt, M::BlasInt, L::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, X::Array{Float64,1},
    LX::BlasInt, U::Array{Float64,2}, LDU::BlasInt,
    E::Array{Float64,1}, J::Array{Float64,1}, LDJ::BlasInt,
    JTE::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:nf01bd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &CJTE, &NSMP,
            &M, &L, IPAR, &LIPAR, X, &LX, U, &LDU, E, J, &LDJ, JTE,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BE(IFLAG::BlasInt, NSMP::BlasInt, N::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, Z::Array{Float64,2},
    LDZ::BlasInt, Y::Array{Float64,2}, LDY::BlasInt,
    X::Array{Float64,1}, NFEVL::BlasInt, E::Array{Float64,1},
    J::Array{Float64,2}, LDJ::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01be_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &IFLAG,
            &NSMP, &N, IPAR, &LIPAR, Z, &LDZ, Y, &LDY, X, &NFEVL, E,
            J, &LDJ, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BE: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BF(IFLAG::BlasInt, NFUN::BlasInt, LX::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, U::Array{Float64,2},
    LDU::BlasInt, Y::Array{Float64,2}, LDY::BlasInt,
    X::Array{Float64,1}, NFEVL::BlasInt, E::Array{Float64,1},
    J::Array{Float64,2}, LDJ::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01bf_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &IFLAG,
            &NFUN, &LX, IPAR, &LIPAR, U, &LDU, Y, &LDY, X, &NFEVL,
            E, J, &LDJ, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BF: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BP(COND::Char, N::BlasInt, IPAR::Array{BlasInt,1},
    LIPAR::BlasInt, R::Array{Float64,2}, LDR::BlasInt,
    IPVT::Array{BlasInt,1}, DIAG::Array{Float64,1},
    QTB::Array{Float64,1}, DELTA::Float64, PAR::Float64,
    RANKS::Array{BlasInt,1}, X::Array{Float64,1},
    RX::Array{Float64,1}, TOL::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01bp_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &COND, &N, IPAR, &LIPAR, R, &LDR, IPVT, DIAG, QTB,
            &DELTA, &PAR, RANKS, X, RX, &TOL, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BP: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BQ(COND::Char, N::BlasInt, IPAR::Array{BlasInt,1},
    LIPAR::BlasInt, R::Array{Float64,2}, LDR::BlasInt,
    IPVT::Array{BlasInt,1}, DIAG::Array{Float64,1},
    QTB::Array{Float64,1}, RANKS::Array{BlasInt,1},
    X::Array{Float64,1}, TOL::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01bq_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &COND, &N, IPAR, &LIPAR, R, &LDR, IPVT,
            DIAG, QTB, RANKS, X, &TOL, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BQ: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BR(COND::Char, UPLO::Char, TRANS::Char, N::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, SDIAG::Array{Float64,1}, S::Array{Float64,2},
    LDS::BlasInt, B::Array{Float64,1}, RANKS::Array{BlasInt,1},
    TOL::Float64, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:nf01br_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &COND, &UPLO,
            &TRANS, &N, IPAR, &LIPAR, R, &LDR, SDIAG, S, &LDS, B,
            RANKS, &TOL, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BR: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BS(N::BlasInt, IPAR::Array{BlasInt,1}, LIPAR::BlasInt,
    FNORM::Float64, J::Array{Float64,1}, LDJ::BlasInt,
    E::Array{Float64,1}, JNORMS::Array{Float64,1}, GNORM::Float64,
    IPVT::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:nf01bs_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, IPAR,
            &LIPAR, &FNORM, J, &LDJ, E, JNORMS, &GNORM, IPVT, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BS: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BU(STOR::Char, UPLO::Char, N::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, DPAR::Array{Float64,1},
    LDPAR::BlasInt, J::Array{Float64,2}, LDJ::BlasInt,
    JTJ::Array{Float64,1}, LDJTJ::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01bu_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &STOR, &UPLO, &N, IPAR, &LIPAR, DPAR, &LDPAR, J, &LDJ,
            JTJ, &LDJTJ, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BU: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BV(STOR::Char, UPLO::Char, N::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, DPAR::Array{Float64,1},
    LDPAR::BlasInt, J::Array{Float64,2}, LDJ::BlasInt,
    JTJ::Array{Float64,1}, LDJTJ::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01bv_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &STOR, &UPLO, &N, IPAR, &LIPAR, DPAR, &LDPAR, J, &LDJ,
            JTJ, &LDJTJ, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BV: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BW(N::BlasInt, IPAR::Array{BlasInt,1}, LIPAR::BlasInt,
    DPAR::Array{Float64,1}, LDPAR::BlasInt, J::Array{Float64,2},
    LDJ::BlasInt, X::Array{Float64,1}, INCX::BlasInt,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01bw_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, IPAR, &LIPAR, DPAR,
            &LDPAR, J, &LDJ, X, &INCX, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BW: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BX(N::BlasInt, IPAR::Array{BlasInt,1}, LIPAR::BlasInt,
    DPAR::Array{Float64,1}, LDPAR::BlasInt, J::Array{Float64,2},
    LDJ::BlasInt, X::Array{Float64,1}, INCX::BlasInt,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:nf01bx_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, IPAR, &LIPAR, DPAR,
            &LDPAR, J, &LDJ, X, &INCX, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BX: the %dth argument had
        an illegal value", -INFO))
    end
end


function NF01BY(CJTE::Char, NSMP::BlasInt, NZ::BlasInt, L::BlasInt,
    IPAR::Array{BlasInt,1}, LIPAR::BlasInt, WB::Array{Float64,1},
    LWB::BlasInt, Z::Array{Float64,2}, LDZ::BlasInt,
    E::Array{Float64,1}, J::Array{Float64,2}, LDJ::BlasInt,
    JTE::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:nf01by_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &CJTE, &NSMP,
            &NZ, &L, IPAR, &LIPAR, WB, &LWB, Z, &LDZ, E, J, &LDJ,
            JTE, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in NF01BY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB01BD(DICO::Char, N::BlasInt, M::BlasInt, NP::BlasInt,
    ALPHA::Float64, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, WR::Array{Float64,1},
    WI::Array{Float64,1}, NFP::BlasInt, NAP::BlasInt, NUP::BlasInt,
    F::Array{Float64,2}, LDF::BlasInt, Z::Array{Float64,2},
    LDZ::BlasInt, TOL::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:sb01bd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &DICO, &N, &M, &NP, &ALPHA, A, &LDA, B,
            &LDB, WR, WI, &NFP, &NAP, &NUP, F, &LDF, Z, &LDZ, &TOL,
            DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB01BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB01BX(REIG::Bool, N::BlasInt, XR::Float64, XI::Float64,
    WR::Array{Float64,1}, WI::Array{Float64,1}, S::Float64,
    P::Float64)

    ccall((:sb01bx_, "libslicot"), Void, (Ptr{Bool}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}), &REIG, &N, &XR, &XI, WR,
            WI, &S, &P)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB01BX: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB01BY(N::BlasInt, M::BlasInt, S::Float64, P::Float64,
    A::Array{Float64,2}, B::Array{Float64,2}, F::Array{Float64,2},
    TOL::Float64, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:sb01by_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &N, &M, &S, &P, A, B, F, &TOL, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB01BY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB01DD(N::BlasInt, M::BlasInt, INDCON::BlasInt,
    A::Array{Float64,1}, LDA::Float64, B::Array{Float64,1},
    LDB::Float64, NBLK::Array{BlasInt,1}, WR::Array{Float64,1},
    WI::Array{Float64,1}, Z::Array{Float64,1}, LDZ::Float64,
    Y::Array{Float64,1}, COUNT::BlasInt, G::Array{Float64,1},
    LDG::Float64, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb01dd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, &M,
            &INDCON, A, &LDA, B, &LDB, NBLK, WR, WI, Z, &LDZ, Y,
            &COUNT, G, &LDG, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB01DD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB01FY(DISCR::Bool, N::BlasInt, M::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, F::Array{Float64,2}, LDF::BlasInt,
    V::Array{Float64,2}, LDV::BlasInt, INFO::BlasInt)

    ccall((:sb01fy_, "libslicot"), Void, (Ptr{Bool}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &DISCR, &N, &M, A, &LDA, B,
            &LDB, F, &LDF, V, &LDV, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB01FY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB01MD(NCONT::BlasInt, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,1}, WR::Array{Float64,1},
    WI::Array{Float64,1}, Z::Array{Float64,2}, LDZ::BlasInt,
    G::Array{Float64,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:sb01md_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &NCONT, &N, A, &LDA, B, WR,
            WI, Z, &LDZ, G, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB01MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02MD(DICO::Char, HINV::Char, UPLO::Char, SCAL::Char,
    SORT::Char, N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    G::Array{Float64,2}, LDG::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, RCOND::Float64, WR::Array{Float64,1},
    WI::Array{Float64,1}, S::Array{Float64,2}, LDS::BlasInt,
    U::Array{Float64,2}, LDU::BlasInt, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, BWORK::Array{Bool,1},
    INFO::BlasInt)

    ccall((:sb02md_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}), &DICO, &HINV, &UPLO, &SCAL,
            &SORT, &N, A, &LDA, G, &LDG, Q, &LDQ, &RCOND, WR, WI, S,
            &LDS, U, &LDU, IWORK, DWORK, &LDWORK, BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02MT(JOBG::Char, JOBL::Char, FACT::Char, UPLO::Char,
    N::BlasInt, M::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, R::Array{Float64,2}, LDR::BlasInt,
    L::Array{Float64,2}, LDL::BlasInt, IPIV::Array{BlasInt,1},
    OUFACT::BlasInt, G::Array{Float64,2}, LDG::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb02mt_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOBG, &JOBL, &FACT, &UPLO,
            &N, &M, A, &LDA, B, &LDB, Q, &LDQ, R, &LDR, L, &LDL,
            IPIV, &OUFACT, G, &LDG, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02MT: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02MU(DICO::Char, HINV::Char, UPLO::Char, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, G::Array{Float64,2},
    LDG::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    S::Array{Float64,2}, LDS::BlasInt, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb02mu_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &HINV, &UPLO, &N, A,
            &LDA, G, &LDG, Q, &LDQ, S, &LDS, IWORK, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02MU: the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02ND(DICO::Char, FACT::Char, UPLO::Char, JOBL::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    R::Array{Float64,2}, LDR::BlasInt, IPIV::Array{BlasInt,1},
    L::Array{Float64,2}, LDL::BlasInt, X::Array{Float64,2},
    LDX::BlasInt, RNORM::Float64, F::Array{Float64,2}, LDF::BlasInt,
    OUFACT::Array{BlasInt,1}, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb02nd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &DICO, &FACT, &UPLO, &JOBL, &N, &M, &P, A, &LDA, B,
            &LDB, R, &LDR, IPIV, L, &LDL, X, &LDX, &RNORM, F, &LDF,
            OUFACT, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02OD(DICO::Char, JOBB::Char, FACT::Char, UPLO::Char,
    JOBL::Char, SORT::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    R::Array{Float64,2}, LDR::BlasInt, L::Array{Float64,2},
    LDL::BlasInt, RCOND::Float64, X::Array{Float64,2}, LDX::BlasInt,
    ALFAR::Array{Float64,1}, ALFAI::Array{Float64,1},
    BETA::Array{Float64,1}, S::Array{Float64,2}, LDS::BlasInt,
    T::Array{Float64,2}, LDT::BlasInt, U::Array{Float64,2},
    LDU::BlasInt, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, BWORK::Array{Bool,1},
    INFO::BlasInt)

    ccall((:sb02od_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Bool}, Ptr{BlasInt}), &DICO, &JOBB,
            &FACT, &UPLO, &JOBL, &SORT, &N, &M, &P, A, &LDA, B,
            &LDB, Q, &LDQ, R, &LDR, L, &LDL, &RCOND, X, &LDX, ALFAR,
            ALFAI, BETA, S, &LDS, T, &LDT, U, &LDU, &TOL, IWORK,
            DWORK, &LDWORK, BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function ()

    ccall((:_, "libslicot"), Void, (), )
    
    if INFO < 0
        error(@sprintf("SlicotError in : the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02OY(TYPE::Char, DICO::Char, JOBB::Char, FACT::Char,
    UPLO::Char, JOBL::Char, JOBE::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, R::Array{Float64,2}, LDR::BlasInt,
    L::Array{Float64,2}, LDL::BlasInt, E::Array{Float64,2},
    LDE::BlasInt, AF::Array{Float64,2}, LDAF::BlasInt,
    BF::Array{Float64,2}, LDBF::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb02oy_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &TYPE, &DICO, &JOBB, &FACT, &UPLO, &JOBL, &JOBE, &N, &M,
            &P, A, &LDA, B, &LDB, Q, &LDQ, R, &LDR, L, &LDL, E,
            &LDE, AF, &LDAF, BF, &LDBF, &TOL, IWORK, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02OY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02PD(JOB::Char, TRANA::Char, UPLO::Char, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, G::Array{Float64,1},
    LDG::Float64, Q::Array{Float64,1}, LDQ::Float64,
    X::Array{Float64,1}, LDX::Float64, RCOND::Float64, FERR::Float64,
    WR::Array{Float64,1}, WI::Array{Float64,1},
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb02pd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &TRANA, &UPLO, &N, A,
            &LDA, G, &LDG, Q, &LDQ, X, &LDX, &RCOND, &FERR, WR, WI,
            IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02QD(JOB::Char, FACT::Char, TRANA::Char, UPLO::Char,
    LYAPUN::Char, N::BlasInt, A::Array{Float64,1}, LDA::Float64,
    T::Array{Float64,1}, LDT::Float64, U::Array{Float64,1},
    LDU::Float64, G::Array{Float64,1}, LDG::Float64,
    Q::Array{Float64,1}, LDQ::Float64, X::Array{Float64,1},
    LDX::Float64, SEP::Float64, RCOND::Float64, FERR::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb02qd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &FACT,
            &TRANA, &UPLO, &LYAPUN, &N, A, &LDA, T, &LDT, U, &LDU,
            G, &LDG, Q, &LDQ, X, &LDX, &SEP, &RCOND, &FERR, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02RD(JOB::Char, DICO::Char, HINV::Char, TRANA::Char,
    UPLO::Char, SCAL::Char, SORT::Char, FACT::Char, LYAPUN::Char,
    N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    T::Array{Float64,2}, LDT::BlasInt, V::Array{Float64,2},
    LDV::BlasInt, G::Array{Float64,2}, LDG::BlasInt,
    Q::Array{Float64,2}, LDQ::BlasInt, X::Array{Float64,2},
    LDX::BlasInt, SEP::Float64, RCOND::Float64, FERR::Float64,
    WR::Array{Float64,1}, WI::Array{Float64,1}, S::Array{Float64,2},
    LDS::BlasInt, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, BWORK::Array{Bool,1}, INFO::BlasInt)

    ccall((:sb02rd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Bool}, Ptr{BlasInt}), &JOB, &DICO,
            &HINV, &TRANA, &UPLO, &SCAL, &SORT, &FACT, &LYAPUN, &N,
            A, &LDA, T, &LDT, V, &LDV, G, &LDG, Q, &LDQ, X, &LDX,
            &SEP, &RCOND, &FERR, WR, WI, S, &LDS, IWORK, DWORK,
            &LDWORK, BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02RU(DICO::Char, HINV::Char, TRANA::Char, UPLO::Char,
    N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    G::Array{Float64,2}, LDG::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, S::Array{Float64,2}, LDS::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb02ru_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &HINV,
            &TRANA, &UPLO, &N, A, &LDA, G, &LDG, Q, &LDQ, S, &LDS,
            IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02RU: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB02SD(JOB::Char, FACT::Char, TRANA::Char, UPLO::Char,
    LYAPUN::Char, N::BlasInt, A::Array{Float64,1}, LDA::Float64,
    T::Array{Float64,1}, LDT::Float64, U::Array{Float64,1},
    LDU::Float64, G::Array{Float64,1}, LDG::Float64,
    Q::Array{Float64,1}, LDQ::Float64, X::Array{Float64,1},
    LDX::Float64, SEPD::Float64, RCOND::Float64, FERR::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb02sd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &FACT,
            &TRANA, &UPLO, &LYAPUN, &N, A, &LDA, T, &LDT, U, &LDU,
            G, &LDG, Q, &LDQ, X, &LDX, &SEPD, &RCOND, &FERR, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB02SD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03MD(DICO::Char, JOB::Char, FACT::Char, TRANA::Char,
    N::BlasInt, A::Array{Float64,1}, LDA::Float64,
    U::Array{Float64,1}, LDU::Float64, C::Array{Float64,1},
    LDC::Float64, SCALE::Float64, SEP::Float64, FERR::Float64,
    WR::Array{Float64,1}, WI::Array{Float64,1},
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb03md_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOB, &FACT, &TRANA,
            &N, A, &LDA, U, &LDU, C, &LDC, &SCALE, &SEP, &FERR, WR,
            WI, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03MU(LTRANL::Bool, LTRANR::Bool, ISGN::BlasInt,
    N1::BlasInt, N2::BlasInt, TL::Array{Float64,1}, LDTL::Float64,
    TR::Array{Float64,1}, LDTR::Float64, B::Array{Float64,1},
    LDB::Float64, SCALE::Float64, X::Array{Float64,1}, LDX::Float64,
    XNORM::Float64, INFO::BlasInt)

    ccall((:sb03mu_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &LTRANL, &LTRANR, &ISGN,
            &N1, &N2, TL, &LDTL, TR, &LDTR, B, &LDB, &SCALE, X,
            &LDX, &XNORM, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03MU: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03MV(LTRAN::Bool, LUPPER::Bool, T::Array{Float64,1},
    LDT::Float64, B::Array{Float64,1}, LDB::Float64, SCALE::Float64,
    X::Array{Float64,1}, LDX::Float64, XNORM::Float64, INFO::BlasInt)

    ccall((:sb03mv_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}), &LTRAN, &LUPPER, T, &LDT, B, &LDB,
            &SCALE, X, &LDX, &XNORM, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03MV: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03MW(LTRAN::Bool, LUPPER::Bool, T::Array{Float64,1},
    LDT::Float64, B::Array{Float64,1}, LDB::Float64, SCALE::Float64,
    X::Array{Float64,1}, LDX::Float64, XNORM::Float64, INFO::BlasInt)

    ccall((:sb03mw_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}), &LTRAN, &LUPPER, T, &LDT, B, &LDB,
            &SCALE, X, &LDX, &XNORM, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03MW: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03MX(TRANA::Char, N::BlasInt, A::Array{Float64,1},
    LDA::Float64, C::Array{Float64,1}, LDC::Float64, SCALE::Float64,
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:sb03mx_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &TRANA, &N,
            A, &LDA, C, &LDC, &SCALE, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03MX: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03MY(TRANA::Char, N::BlasInt, A::Array{Float64,1},
    LDA::Float64, C::Array{Float64,1}, LDC::Float64, SCALE::Float64,
    INFO::BlasInt)

    ccall((:sb03my_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &TRANA, &N, A, &LDA, C,
            &LDC, &SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03MY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03OD(DICO::Char, FACT::Char, TRANS::Char, N::BlasInt,
    M::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    Q::Array{Float64,2}, LDQ::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, SCALE::Float64, WR::Array{Float64,1},
    WI::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb03od_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &FACT,
            &TRANS, &N, &M, A, &LDA, Q, &LDQ, B, &LDB, &SCALE, WR,
            WI, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03OR(DISCR::Bool, LTRANS::Bool, N::BlasInt, M::BlasInt,
    S::Array{Float64,1}, LDS::Float64, A::Array{Float64,1},
    LDA::Float64, C::Array{Float64,1}, LDC::Float64, SCALE::Float64,
    INFO::BlasInt)

    ccall((:sb03or_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &DISCR, &LTRANS, &N, &M, S,
            &LDS, A, &LDA, C, &LDC, &SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03OR: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03OT(DISCR::Bool, LTRANS::Bool, N::BlasInt,
    S::Array{Float64,2}, LDS::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, SCALE::Float64, DWORK::Array{Float64,1},
    INFO::BlasInt)

    ccall((:sb03ot_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &DISCR, &LTRANS, &N, S, &LDS, R, &LDR, &SCALE, DWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03OT: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03OU(DISCR::Bool, LTRANS::Bool, N::BlasInt, M::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, TAU::Array{Float64,1}, U::Array{Float64,2},
    LDU::BlasInt, SCALE::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03ou_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &DISCR, &LTRANS, &N, &M, A, &LDA, B,
            &LDB, TAU, U, &LDU, &SCALE, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03OU: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03OV(A::Array{Float64,1}, B::Float64, C::Array{Float64,1},
    S::Float64)

    ccall((:sb03ov_, "libslicot"), Void, (Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}), A, &B, C, &S)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03OV: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03OY(DISCR::Bool, LTRANS::Bool, ISGN::BlasInt,
    S::Array{Float64,2}, LDS::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, A::Array{Float64,2}, LDA::BlasInt, SCALE::Float64,
    INFO::BlasInt)

    ccall((:sb03oy_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}), &DISCR, &LTRANS, &ISGN, S, &LDS, R, &LDR,
            A, &LDA, &SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03OY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03PD(JOB::Char, FACT::Char, TRANA::Char, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, U::Array{Float64,1},
    LDU::Float64, C::Array{Float64,1}, LDC::Float64, SCALE::Float64,
    SEPD::Float64, FERR::Float64, WR::Array{Float64,1},
    WI::Array{Float64,1}, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03pd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOB, &FACT, &TRANA, &N, A, &LDA, U,
            &LDU, C, &LDC, &SCALE, &SEPD, &FERR, WR, WI, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03QD(JOB::Char, FACT::Char, TRANA::Char, UPLO::Char,
    LYAPUN::Char, N::BlasInt, SCALE::Float64, A::Array{Float64,1},
    LDA::Float64, T::Array{Float64,1}, LDT::Float64,
    U::Array{Float64,1}, LDU::Float64, C::Array{Float64,1},
    LDC::Float64, X::Array{Float64,1}, LDX::Float64, SEP::Float64,
    RCOND::Float64, FERR::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03qd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &FACT, &TRANA, &UPLO,
            &LYAPUN, &N, &SCALE, A, &LDA, T, &LDT, U, &LDU, C, &LDC,
            X, &LDX, &SEP, &RCOND, &FERR, IWORK, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03QX(TRANA::Char, UPLO::Char, LYAPUN::Char, N::BlasInt,
    XANORM::Float64, T::Array{Float64,1}, LDT::Float64,
    U::Array{Float64,1}, LDU::Float64, R::Array{Float64,1},
    LDR::Float64, FERR::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03qx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &TRANA, &UPLO, &LYAPUN, &N,
            &XANORM, T, &LDT, U, &LDU, R, &LDR, &FERR, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03QX: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03QY(JOB::Char, TRANA::Char, LYAPUN::Char, N::BlasInt,
    T::Array{Float64,1}, LDT::Float64, U::Array{Float64,1},
    LDU::Float64, X::Array{Float64,1}, LDX::Float64, SEP::Float64,
    THNORM::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03qy_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &TRANA, &LYAPUN, &N,
            T, &LDT, U, &LDU, X, &LDX, &SEP, &THNORM, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03QY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03RD(JOB::Char, FACT::Char, TRANA::Char, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, U::Array{Float64,1},
    LDU::Float64, C::Array{Float64,1}, LDC::Float64, SCALE::Float64,
    SEP::Float64, FERR::Float64, WR::Array{Float64,1},
    WI::Array{Float64,1}, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03rd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOB, &FACT, &TRANA, &N, A, &LDA, U,
            &LDU, C, &LDC, &SCALE, &SEP, &FERR, WR, WI, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03SD(JOB::Char, FACT::Char, TRANA::Char, UPLO::Char,
    LYAPUN::Char, N::BlasInt, SCALE::Float64, A::Array{Float64,1},
    LDA::Float64, T::Array{Float64,1}, LDT::Float64,
    U::Array{Float64,1}, LDU::Float64, C::Array{Float64,1},
    LDC::Float64, X::Array{Float64,1}, LDX::Float64, SEPD::Float64,
    RCOND::Float64, FERR::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03sd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &FACT, &TRANA, &UPLO,
            &LYAPUN, &N, &SCALE, A, &LDA, T, &LDT, U, &LDU, C, &LDC,
            X, &LDX, &SEPD, &RCOND, &FERR, IWORK, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03SD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03SX(TRANA::Char, UPLO::Char, LYAPUN::Char, N::BlasInt,
    XANORM::Float64, T::Array{Float64,1}, LDT::Float64,
    U::Array{Float64,1}, LDU::Float64, R::Array{Float64,1},
    LDR::Float64, FERR::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03sx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &TRANA, &UPLO, &LYAPUN, &N,
            &XANORM, T, &LDT, U, &LDU, R, &LDR, &FERR, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03SX: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03SY(JOB::Char, TRANA::Char, LYAPUN::Char, N::BlasInt,
    T::Array{Float64,1}, LDT::Float64, U::Array{Float64,1},
    LDU::Float64, XA::Array{Float64,1}, LDXA::Float64, SEPD::Float64,
    THNORM::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03sy_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &TRANA, &LYAPUN, &N,
            T, &LDT, U, &LDU, XA, &LDXA, &SEPD, &THNORM, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03SY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03TD(JOB::Char, FACT::Char, TRANA::Char, UPLO::Char,
    LYAPUN::Char, N::BlasInt, SCALE::Float64, A::Array{Float64,1},
    LDA::Float64, T::Array{Float64,1}, LDT::Float64,
    U::Array{Float64,1}, LDU::Float64, C::Array{Float64,1},
    LDC::Float64, X::Array{Float64,1}, LDX::Float64, SEP::Float64,
    RCOND::Float64, FERR::Float64, WR::Array{Float64,1},
    WI::Array{Float64,1}, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03td_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOB, &FACT, &TRANA, &UPLO, &LYAPUN, &N, &SCALE, A,
            &LDA, T, &LDT, U, &LDU, C, &LDC, X, &LDX, &SEP, &RCOND,
            &FERR, WR, WI, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03TD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB03UD(JOB::Char, FACT::Char, TRANA::Char, UPLO::Char,
    LYAPUN::Char, N::BlasInt, SCALE::Float64, A::Array{Float64,1},
    LDA::Float64, T::Array{Float64,1}, LDT::Float64,
    U::Array{Float64,1}, LDU::Float64, C::Array{Float64,1},
    LDC::Float64, X::Array{Float64,1}, LDX::Float64, SEPD::Float64,
    RCOND::Float64, FERR::Float64, WR::Array{Float64,1},
    WI::Array{Float64,1}, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb03ud_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOB, &FACT, &TRANA, &UPLO, &LYAPUN, &N, &SCALE, A,
            &LDA, T, &LDT, U, &LDU, C, &LDC, X, &LDX, &SEPD, &RCOND,
            &FERR, WR, WI, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB03UD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04MD(N::BlasInt, M::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, Z::Array{Float64,2},
    LDZ::BlasInt, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb04md_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &N, &M, A, &LDA, B, &LDB, C, &LDC, Z, &LDZ, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04MR(M::BlasInt, D::Array{Float64,1},
    IPR::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:sb04mr_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &M, D, IPR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04MR: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04MU(N::BlasInt, M::BlasInt, IND::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,1}, IPR::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:sb04mu_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &IND, A, &LDA, B,
            &LDB, C, &LDC, D, IPR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04MU: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04MW(M::BlasInt, D::Array{Float64,1},
    IPR::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:sb04mw_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &M, D, IPR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04MW: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04MY(N::BlasInt, M::BlasInt, IND::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,1}, IPR::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:sb04my_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &IND, A, &LDA, B,
            &LDB, C, &LDC, D, IPR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04MY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04ND(ABSCHU::Char, ULA::Char, ULB::Char, N::BlasInt,
    M::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb04nd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &ABSCHU, &ULA, &ULB, &N,
            &M, A, &LDA, B, &LDB, C, &LDC, &TOL, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04NV(ABSCHR::Char, UL::Char, N::BlasInt, M::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, INDX::BlasInt,
    AB::Array{Float64,2}, LDAB::BlasInt, D::Array{Float64,1})

    ccall((:sb04nv_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}),
            &ABSCHR, &UL, &N, &M, C, &LDC, &INDX, AB, &LDAB, D)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04NV: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04NW(ABSCHR::Char, UL::Char, N::BlasInt, M::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, INDX::BlasInt,
    AB::Array{Float64,2}, LDAB::BlasInt, D::Array{Float64,1})

    ccall((:sb04nw_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}),
            &ABSCHR, &UL, &N, &M, C, &LDC, &INDX, AB, &LDAB, D)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04NW: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04NX(RC::Char, UL::Char, M::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, LAMBD1::Float64, LAMBD2::Float64, LAMBD3::Float64,
    LAMBD4::Float64, D::Array{Float64,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,2}, LDDWOR::BlasInt,
    INFO::BlasInt)

    ccall((:sb04nx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &RC, &UL, &M, A, &LDA, &LAMBD1, &LAMBD2,
            &LAMBD3, &LAMBD4, D, &TOL, IWORK, DWORK, &LDDWOR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04NX: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04NY(RC::Char, UL::Char, M::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, LAMBDA::Float64, D::Array{Float64,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,2}, LDDWOR::BlasInt,
    INFO::BlasInt)

    ccall((:sb04ny_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &RC, &UL, &M, A, &LDA,
            &LAMBDA, D, &TOL, IWORK, DWORK, &LDDWOR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04NY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04OD(REDUCE::Char, TRANS::Char, JOBD::Char, M::BlasInt,
    N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt,
    E::Array{Float64,2}, LDE::BlasInt, F::Array{Float64,2},
    LDF::BlasInt, SCALE::Float64, DIF::Float64, P::Array{Float64,2},
    LDP::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    U::Array{Float64,2}, LDU::BlasInt, V::Array{Float64,2},
    LDV::BlasInt, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb04od_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &REDUCE, &TRANS, &JOBD, &M, &N, A, &LDA,
            B, &LDB, C, &LDC, D, &LDD, E, &LDE, F, &LDF, &SCALE,
            &DIF, P, &LDP, Q, &LDQ, U, &LDU, V, &LDV, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04OW(M::BlasInt, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, D::Array{Float64,2},
    LDD::BlasInt, E::Array{Float64,2}, LDE::BlasInt,
    F::Array{Float64,2}, LDF::BlasInt, SCALE::Float64,
    IWORK::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:sb04ow_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &M, &N, A,
            &LDA, B, &LDB, C, &LDC, D, &LDD, E, &LDE, F, &LDF,
            &SCALE, IWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04OW: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04PD(DICO::Char, FACTA::Char, FACTB::Char, TRANA::Char,
    TRANB::Char, ISGN::BlasInt, M::BlasInt, N::BlasInt,
    A::Array{Float64,1}, LDA::Float64, U::Array{Float64,1},
    LDU::Float64, B::Array{Float64,1}, LDB::Float64,
    V::Array{Float64,1}, LDV::Float64, C::Array{Float64,1},
    LDC::Float64, SCALE::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb04pd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &DICO, &FACTA, &FACTB, &TRANA, &TRANB, &ISGN, &M, &N, A,
            &LDA, U, &LDU, B, &LDB, V, &LDV, C, &LDC, &SCALE, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04PX(LTRANL::Bool, LTRANR::Bool, ISGN::BlasInt,
    N1::BlasInt, N2::BlasInt, TL::Array{Float64,1}, LDTL::Float64,
    TR::Array{Float64,1}, LDTR::Float64, B::Array{Float64,1},
    LDB::Float64, SCALE::Float64, X::Array{Float64,1}, LDX::Float64,
    XNORM::Float64, INFO::BlasInt)

    ccall((:sb04px_, "libslicot"), Void, (Ptr{Bool}, Ptr{Bool},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}), &LTRANL, &LTRANR, &ISGN,
            &N1, &N2, TL, &LDTL, TR, &LDTR, B, &LDB, &SCALE, X,
            &LDX, &XNORM, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04PX: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04PY(TRANA::Char, TRANB::Char, ISGN::BlasInt, M::BlasInt,
    N::BlasInt, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, SCALE::Float64, DWORK::Array{Float64,1},
    INFO::BlasInt)

    ccall((:sb04py_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &TRANA, &TRANB, &ISGN, &M, &N, A, &LDA, B, &LDB, C,
            &LDC, &SCALE, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04PY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04QD(N::BlasInt, M::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, Z::Array{Float64,2},
    LDZ::BlasInt, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb04qd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &N, &M, A, &LDA, B, &LDB, C, &LDC, Z, &LDZ, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04QR(M::BlasInt, D::Array{Float64,1},
    IPR::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:sb04qr_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &M, D, IPR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04QR: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04QU(N::BlasInt, M::BlasInt, IND::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,1}, IPR::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:sb04qu_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &IND, A, &LDA, B,
            &LDB, C, &LDC, D, IPR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04QU: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04QY(N::BlasInt, M::BlasInt, IND::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,1}, IPR::Array{BlasInt,1}, INFO::BlasInt)

    ccall((:sb04qy_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &IND, A, &LDA, B,
            &LDB, C, &LDC, D, IPR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04QY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04RD(ABSCHU::Char, ULA::Char, ULB::Char, N::BlasInt,
    M::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb04rd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &ABSCHU, &ULA, &ULB, &N,
            &M, A, &LDA, B, &LDB, C, &LDC, &TOL, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04RV(ABSCHR::Char, UL::Char, N::BlasInt, M::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, INDX::BlasInt,
    AB::Array{Float64,2}, LDAB::BlasInt, BA::Array{Float64,2},
    LDBA::BlasInt, D::Array{Float64,1}, DWORK::Array{Float64,1})

    ccall((:sb04rv_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}), &ABSCHR, &UL,
            &N, &M, C, &LDC, &INDX, AB, &LDAB, BA, &LDBA, D, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04RV: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04RW(ABSCHR::Char, UL::Char, N::BlasInt, M::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, INDX::BlasInt,
    AB::Array{Float64,2}, LDAB::BlasInt, BA::Array{Float64,2},
    LDBA::BlasInt, D::Array{Float64,1}, DWORK::Array{Float64,1})

    ccall((:sb04rw_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}), &ABSCHR, &UL,
            &N, &M, C, &LDC, &INDX, AB, &LDAB, BA, &LDBA, D, DWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04RW: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04RX(RC::Char, UL::Char, M::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, LAMBD1::Float64, LAMBD2::Float64, LAMBD3::Float64,
    LAMBD4::Float64, D::Array{Float64,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,2}, LDDWOR::BlasInt,
    INFO::BlasInt)

    ccall((:sb04rx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &RC, &UL, &M, A, &LDA, &LAMBD1, &LAMBD2,
            &LAMBD3, &LAMBD4, D, &TOL, IWORK, DWORK, &LDDWOR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04RX: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB04RY(RC::Char, UL::Char, M::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, LAMBDA::Float64, D::Array{Float64,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,2}, LDDWOR::BlasInt,
    INFO::BlasInt)

    ccall((:sb04ry_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &RC, &UL, &M, A, &LDA,
            &LAMBDA, D, &TOL, IWORK, DWORK, &LDDWOR, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB04RY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB06ND(N::BlasInt, M::BlasInt, KMAX::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, KSTAIR::Array{BlasInt,1}, U::Array{Float64,2},
    LDU::BlasInt, F::Array{Float64,2}, LDF::BlasInt,
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:sb06nd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &N, &M, &KMAX, A, &LDA, B, &LDB, KSTAIR, U, &LDU, F,
            &LDF, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB06ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB08CD(DICO::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, NQ::BlasInt, NR::BlasInt,
    BR::Array{Float64,2}, LDBR::BlasInt, DR::Array{Float64,2},
    LDDR::BlasInt, TOL::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:sb08cd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &DICO, &N, &M, &P, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, &NQ, &NR, BR, &LDBR, DR, &LDDR, &TOL,
            DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB08CD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB08DD(DICO::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, NQ::BlasInt, NR::BlasInt,
    CR::Array{Float64,2}, LDCR::BlasInt, DR::Array{Float64,2},
    LDDR::BlasInt, TOL::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, IWARN::BlasInt, INFO::BlasInt)

    ccall((:sb08dd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &DICO, &N, &M, &P, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, &NQ, &NR, CR, &LDCR, DR, &LDDR, &TOL,
            DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB08DD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB08ED(DICO::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    ALPHA::Array{Float64,1}, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt, NQ::BlasInt,
    NR::BlasInt, BR::Array{Float64,2}, LDBR::BlasInt,
    DR::Array{Float64,2}, LDDR::BlasInt, TOL::Float64,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:sb08ed_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &N, &M, &P, ALPHA,
            A, &LDA, B, &LDB, C, &LDC, D, &LDD, &NQ, &NR, BR, &LDBR,
            DR, &LDDR, &TOL, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB08ED: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB08FD(DICO::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    ALPHA::Array{Float64,1}, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt, NQ::BlasInt,
    NR::BlasInt, CR::Array{Float64,2}, LDCR::BlasInt,
    DR::Array{Float64,2}, LDDR::BlasInt, TOL::Float64,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:sb08fd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &N, &M, &P, ALPHA,
            A, &LDA, B, &LDB, C, &LDC, D, &LDD, &NQ, &NR, CR, &LDCR,
            DR, &LDDR, &TOL, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB08FD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB08GD(N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, BR::Array{Float64,2},
    LDBR::BlasInt, DR::Array{Float64,2}, LDDR::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:sb08gd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &N, &M, &P, A, &LDA, B, &LDB, C, &LDC, D, &LDD, BR,
            &LDBR, DR, &LDDR, IWORK, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB08GD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB08HD(N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, CR::Array{Float64,2},
    LDCR::BlasInt, DR::Array{Float64,2}, LDDR::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:sb08hd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &N, &M, &P, A, &LDA, B, &LDB, C, &LDC, D, &LDD, CR,
            &LDCR, DR, &LDDR, IWORK, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB08HD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB08MD(ACONA::Char, DA::BlasInt, A::Array{Float64,1},
    RES::Float64, E::Array{Float64,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb08md_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &ACONA, &DA, A, &RES, E,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB08MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB08MY(DA::BlasInt, A::Array{Float64,1}, B::Array{Float64,1},
    EPSB::Float64)

    ccall((:sb08my_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}), &DA, A, B, &EPSB)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB08MY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB08ND(ACONA::Char, DA::BlasInt, A::Array{Float64,1},
    RES::Float64, E::Array{Float64,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb08nd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &ACONA, &DA, A, &RES, E,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB08ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB08NY(DA::BlasInt, A::Array{Float64,1}, B::Array{Float64,1},
    EPSB::Float64)

    ccall((:sb08ny_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}), &DA, A, B, &EPSB)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB08NY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB09MD(N::BlasInt, NC::BlasInt, NB::BlasInt,
    H1::Array{Float64,2}, LDH1::BlasInt, H2::Array{Float64,2},
    LDH2::BlasInt, SS::Array{Float64,2}, LDSS::BlasInt,
    SE::Array{Float64,2}, LDSE::BlasInt, PRE::Array{Float64,2},
    LDPRE::BlasInt, TOL::Float64, INFO::BlasInt)

    ccall((:sb09md_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}), &N, &NC, &NB, H1, &LDH1, H2, &LDH2, SS,
            &LDSS, SE, &LDSE, PRE, &LDPRE, &TOL, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB09MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10AD(JOB::BlasInt, N::BlasInt, M::BlasInt, NP::BlasInt,
    NCON::BlasInt, NMEAS::BlasInt, GAMMA::Float64,
    A::Array{Float64,1}, LDA::Float64, B::Array{Float64,1},
    LDB::Float64, C::Array{Float64,1}, LDC::Float64,
    D::Array{Float64,1}, LDD::Float64, AK::Array{Float64,1},
    LDAK::Float64, BK::Array{Float64,1}, LDBK::Float64,
    CK::Array{Float64,1}, LDCK::Float64, DK::Array{Float64,1},
    LDDK::Float64, AC::Array{Float64,1}, LDAC::Float64,
    BC::Array{Float64,1}, LDBC::Float64, CC::Array{Float64,1},
    LDCC::Float64, DC::Array{Float64,1}, LDDC::Float64,
    RCOND::Array{Float64,1}, GTOL::Float64, ACTOL::Float64,
    IWORK::Array{BlasInt,1}, LIWORK::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, BWORK::Array{Bool,1}, LBWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb10ad_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &N, &M,
            &NP, &NCON, &NMEAS, &GAMMA, A, &LDA, B, &LDB, C, &LDC,
            D, &LDD, AK, &LDAK, BK, &LDBK, CK, &LDCK, DK, &LDDK, AC,
            &LDAC, BC, &LDBC, CC, &LDCC, DC, &LDDC, RCOND, &GTOL,
            &ACTOL, IWORK, &LIWORK, DWORK, &LDWORK, BWORK, &LBWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10DD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, GAMMA::Float64, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    AK::Array{Float64,1}, LDAK::Float64, BK::Array{Float64,1},
    LDBK::Float64, CK::Array{Float64,1}, LDCK::Float64,
    DK::Array{Float64,1}, LDDK::Float64, X::Array{Float64,1},
    LDX::Float64, Z::Array{Float64,1}, LDZ::Float64,
    RCOND::Array{Float64,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, BWORK::Array{Bool,1},
    INFO::BlasInt)

    ccall((:sb10dd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Bool}, Ptr{BlasInt}), &N, &M, &NP,
            &NCON, &NMEAS, &GAMMA, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, AK, &LDAK, BK, &LDBK, CK, &LDCK, DK, &LDDK, X,
            &LDX, Z, &LDZ, RCOND, &TOL, IWORK, DWORK, &LDWORK,
            BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10DD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10ED(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    AK::Array{Float64,1}, LDAK::Float64, BK::Array{Float64,1},
    LDBK::Float64, CK::Array{Float64,1}, LDCK::Float64,
    DK::Array{Float64,1}, LDDK::Float64, RCOND::Array{Float64,1},
    TOL::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, BWORK::Array{Bool,1}, INFO::BlasInt)

    ccall((:sb10ed_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}), &N, &M, &NP, &NCON, &NMEAS, A,
            &LDA, B, &LDB, C, &LDC, D, &LDD, AK, &LDAK, BK, &LDBK,
            CK, &LDCK, DK, &LDDK, RCOND, &TOL, IWORK, DWORK,
            &LDWORK, BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10ED: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10FD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, GAMMA::Float64, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    AK::Array{Float64,1}, LDAK::Float64, BK::Array{Float64,1},
    LDBK::Float64, CK::Array{Float64,1}, LDCK::Float64,
    DK::Array{Float64,1}, LDDK::Float64, RCOND::Array{Float64,1},
    TOL::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, BWORK::Array{Bool,1}, INFO::BlasInt)

    ccall((:sb10fd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Bool}, Ptr{BlasInt}), &N, &M, &NP,
            &NCON, &NMEAS, &GAMMA, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, AK, &LDAK, BK, &LDBK, CK, &LDCK, DK, &LDDK, RCOND,
            &TOL, IWORK, DWORK, &LDWORK, BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10FD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10HD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    AK::Array{Float64,1}, LDAK::Float64, BK::Array{Float64,1},
    LDBK::Float64, CK::Array{Float64,1}, LDCK::Float64,
    DK::Array{Float64,1}, LDDK::Float64, RCOND::Array{Float64,1},
    TOL::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, BWORK::Array{Bool,1}, INFO::BlasInt)

    ccall((:sb10hd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}), &N, &M, &NP, &NCON, &NMEAS, A,
            &LDA, B, &LDB, C, &LDC, D, &LDD, AK, &LDAK, BK, &LDBK,
            CK, &LDCK, DK, &LDDK, RCOND, &TOL, IWORK, DWORK,
            &LDWORK, BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10HD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10ID(N::BlasInt, M::BlasInt, NP::BlasInt,
    A::Array{Float64,1}, LDA::Float64, B::Array{Float64,1},
    LDB::Float64, C::Array{Float64,1}, LDC::Float64,
    D::Array{Float64,1}, LDD::Float64, FACTOR::Float64, NK::BlasInt,
    AK::Array{Float64,1}, LDAK::Float64, BK::Array{Float64,1},
    LDBK::Float64, CK::Array{Float64,1}, LDCK::Float64,
    DK::Array{Float64,1}, LDDK::Float64, RCOND::Array{Float64,1},
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    BWORK::Array{Bool,1}, INFO::BlasInt)

    ccall((:sb10id_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Bool},
            Ptr{BlasInt}), &N, &M, &NP, A, &LDA, B, &LDB, C, &LDC,
            D, &LDD, &FACTOR, &NK, AK, &LDAK, BK, &LDBK, CK, &LDCK,
            DK, &LDDK, RCOND, IWORK, DWORK, &LDWORK, BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10ID: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10JD(N::BlasInt, M::BlasInt, NP::BlasInt,
    A::Array{Float64,1}, LDA::Float64, B::Array{Float64,1},
    LDB::Float64, C::Array{Float64,1}, LDC::Float64,
    D::Array{Float64,1}, LDD::Float64, E::Array{Float64,1},
    LDE::Float64, NSYS::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb10jd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &NP,
            A, &LDA, B, &LDB, C, &LDC, D, &LDD, E, &LDE, &NSYS,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10JD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10KD(N::BlasInt, M::BlasInt, NP::BlasInt,
    A::Array{Float64,1}, LDA::Float64, B::Array{Float64,1},
    LDB::Float64, C::Array{Float64,1}, LDC::Float64, FACTOR::Float64,
    AK::Array{Float64,1}, LDAK::Float64, BK::Array{Float64,1},
    LDBK::Float64, CK::Array{Float64,1}, LDCK::Float64,
    DK::Array{Float64,1}, LDDK::Float64, RCOND::Array{Float64,1},
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    BWORK::Array{Bool,1}, INFO::BlasInt)

    ccall((:sb10kd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}), &N, &M, &NP, A, &LDA, B, &LDB,
            C, &LDC, &FACTOR, AK, &LDAK, BK, &LDBK, CK, &LDCK, DK,
            &LDDK, RCOND, IWORK, DWORK, &LDWORK, BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10KD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10LD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    AK::Array{Float64,1}, LDAK::Float64, BK::Array{Float64,1},
    LDBK::Float64, CK::Array{Float64,1}, LDCK::Float64,
    DK::Array{Float64,1}, LDDK::Float64, AC::Array{Float64,1},
    LDAC::Float64, BC::Array{Float64,1}, LDBC::Float64,
    CC::Array{Float64,1}, LDCC::Float64, DC::Array{Float64,1},
    LDDC::Float64, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb10ld_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &NP,
            &NCON, &NMEAS, A, &LDA, B, &LDB, C, &LDC, D, &LDD, AK,
            &LDAK, BK, &LDBK, CK, &LDCK, DK, &LDDK, AC, &LDAC, BC,
            &LDBC, CC, &LDCC, DC, &LDDC, IWORK, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10LD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10MD(NC::BlasInt, MP::BlasInt, LENDAT::BlasInt, F::BlasInt,
    ORD::BlasInt, MNB::BlasInt, NBLOCK::Array{BlasInt,1},
    ITYPE::Array{BlasInt,1}, QUTOL::Float64, A::Array{Float64,1},
    LDA::BlasInt, B::Array{Float64,1}, LDB::BlasInt,
    C::Array{Float64,1}, LDC::BlasInt, D::Array{Float64,1},
    LDD::BlasInt, OMEGA::Array{Float64,1}, TOTORD::BlasInt,
    AD::Array{Float64,1}, LDAD::BlasInt, BD::Array{Float64,1},
    LDBD::BlasInt, CD::Array{Float64,1}, LDCD::BlasInt,
    DD::Array{Float64,1}, LDDD::BlasInt, MJU::Array{Float64,1},
    IWORK::Array{BlasInt,1}, LIWORK::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, ZWORK::Array{Complex128,1}, LZWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb10md_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{BlasInt}), &NC, &MP, &LENDAT, &F,
            &ORD, &MNB, NBLOCK, ITYPE, &QUTOL, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, OMEGA, &TOTORD, AD, &LDAD, BD, &LDBD, CD,
            &LDCD, DD, &LDDD, MJU, IWORK, &LIWORK, DWORK, &LDWORK,
            ZWORK, &LZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10PD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    TU::Array{Float64,1}, LDTU::Float64, TY::Array{Float64,1},
    LDTY::Float64, RCOND::Array{Float64,1}, TOL::Float64,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb10pd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &N, &M, &NP, &NCON, &NMEAS, A, &LDA, B, &LDB, C, &LDC,
            D, &LDD, TU, &LDTU, TY, &LDTY, RCOND, &TOL, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10QD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, GAMMA::Float64, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    F::Array{Float64,1}, LDF::Float64, H::Array{Float64,1},
    LDH::Float64, X::Array{Float64,1}, LDX::Float64,
    Y::Array{Float64,1}, LDY::Float64, XYCOND::Array{Float64,1},
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    BWORK::Array{Bool,1}, INFO::BlasInt)

    ccall((:sb10qd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}), &N, &M, &NP, &NCON, &NMEAS,
            &GAMMA, A, &LDA, B, &LDB, C, &LDC, D, &LDD, F, &LDF, H,
            &LDH, X, &LDX, Y, &LDY, XYCOND, IWORK, DWORK, &LDWORK,
            BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10RD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, GAMMA::Float64, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    F::Array{Float64,1}, LDF::Float64, H::Array{Float64,1},
    LDH::Float64, TU::Array{Float64,1}, LDTU::Float64,
    TY::Array{Float64,1}, LDTY::Float64, X::Array{Float64,1},
    LDX::Float64, Y::Array{Float64,1}, LDY::Float64,
    AK::Array{Float64,1}, LDAK::Float64, BK::Array{Float64,1},
    LDBK::Float64, CK::Array{Float64,1}, LDCK::Float64,
    DK::Array{Float64,1}, LDDK::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb10rd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &N, &M, &NP, &NCON, &NMEAS, &GAMMA, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, F, &LDF, H, &LDH, TU, &LDTU, TY, &LDTY,
            X, &LDX, Y, &LDY, AK, &LDAK, BK, &LDBK, CK, &LDCK, DK,
            &LDDK, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10SD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    AK::Array{Float64,1}, LDAK::Float64, BK::Array{Float64,1},
    LDBK::Float64, CK::Array{Float64,1}, LDCK::Float64,
    DK::Array{Float64,1}, LDDK::Float64, X::Array{Float64,1},
    LDX::Float64, Y::Array{Float64,1}, LDY::Float64,
    RCOND::Array{Float64,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, BWORK::Array{Bool,1},
    INFO::BlasInt)

    ccall((:sb10sd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}), &N, &M, &NP, &NCON, &NMEAS, A,
            &LDA, B, &LDB, C, &LDC, D, &LDD, AK, &LDAK, BK, &LDBK,
            CK, &LDCK, DK, &LDDK, X, &LDX, Y, &LDY, RCOND, &TOL,
            IWORK, DWORK, &LDWORK, BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10SD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10TD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, D::Array{Float64,1}, LDD::Float64,
    TU::Array{Float64,1}, LDTU::Float64, TY::Array{Float64,1},
    LDTY::Float64, AK::Array{Float64,1}, LDAK::Float64,
    BK::Array{Float64,1}, LDBK::Float64, CK::Array{Float64,1},
    LDCK::Float64, DK::Array{Float64,1}, LDDK::Float64,
    RCOND::Float64, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb10td_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &NP,
            &NCON, &NMEAS, D, &LDD, TU, &LDTU, TY, &LDTY, AK, &LDAK,
            BK, &LDBK, CK, &LDCK, DK, &LDDK, &RCOND, &TOL, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10TD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10UD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, B::Array{Float64,1}, LDB::Float64,
    C::Array{Float64,1}, LDC::Float64, D::Array{Float64,1},
    LDD::Float64, TU::Array{Float64,1}, LDTU::Float64,
    TY::Array{Float64,1}, LDTY::Float64, RCOND::Array{Float64,1},
    TOL::Float64, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sb10ud_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &NP, &NCON, &NMEAS,
            B, &LDB, C, &LDC, D, &LDD, TU, &LDTU, TY, &LDTY, RCOND,
            &TOL, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10UD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10VD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, F::Array{Float64,1}, LDF::Float64,
    H::Array{Float64,1}, LDH::Float64, X::Array{Float64,1},
    LDX::Float64, Y::Array{Float64,1}, LDY::Float64,
    XYCOND::Array{Float64,1}, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, BWORK::Array{Bool,1},
    INFO::BlasInt)

    ccall((:sb10vd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Bool}, Ptr{BlasInt}), &N, &M, &NP,
            &NCON, &NMEAS, A, &LDA, B, &LDB, C, &LDC, F, &LDF, H,
            &LDH, X, &LDX, Y, &LDY, XYCOND, IWORK, DWORK, &LDWORK,
            BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10VD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10WD(N::BlasInt, M::BlasInt, NP::BlasInt, NCON::BlasInt,
    NMEAS::BlasInt, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64,
    F::Array{Float64,1}, LDF::Float64, H::Array{Float64,1},
    LDH::Float64, TU::Array{Float64,1}, LDTU::Float64,
    TY::Array{Float64,1}, LDTY::Float64, AK::Array{Float64,1},
    LDAK::Float64, BK::Array{Float64,1}, LDBK::Float64,
    CK::Array{Float64,1}, LDCK::Float64, DK::Array{Float64,1},
    LDDK::Float64, INFO::BlasInt)

    ccall((:sb10wd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &N, &M, &NP, &NCON, &NMEAS, A, &LDA, B, &LDB, C, &LDC,
            D, &LDD, F, &LDF, H, &LDH, TU, &LDTU, TY, &LDTY, AK,
            &LDAK, BK, &LDBK, CK, &LDCK, DK, &LDDK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10WD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10YD(DISCFL::BlasInt, FLAG::BlasInt, LENDAT::BlasInt,
    RFRDAT::Array{Float64,1}, IFRDAT::Array{Float64,1},
    OMEGA::Array{Float64,1}, N::BlasInt, A::Array{Float64,1},
    LDA::BlasInt, B::Array{Float64,1}, C::Array{Float64,1},
    D::Array{Float64,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt,
    ZWORK::Array{Complex128,1}, LZWORK::BlasInt, INFO::BlasInt)

    ccall((:sb10yd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{BlasInt}), &DISCFL, &FLAG, &LENDAT,
            RFRDAT, IFRDAT, OMEGA, &N, A, &LDA, B, C, D, &TOL,
            IWORK, DWORK, &LDWORK, ZWORK, &LZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10YD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10ZD(N::BlasInt, M::BlasInt, NP::BlasInt, A::Float64,
    LDA::Float64, B::Float64, LDB::Float64, C::Float64, LDC::Float64,
    D::Float64, LDD::Float64, FACTOR::Float64, AK::Array{Float64,1},
    LDAK::Float64, BK::Array{Float64,1}, LDBK::Float64,
    CK::Array{Float64,1}, LDCK::Float64, DK::Array{Float64,1},
    LDDK::Float64, RCOND::Array{Float64,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    BWORK::Array{Bool,1}, INFO::BlasInt)

    ccall((:sb10zd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Bool},
            Ptr{BlasInt}), &N, &M, &NP, &A, &LDA, &B, &LDB, &C,
            &LDC, &D, &LDD, &FACTOR, AK, &LDAK, BK, &LDBK, CK,
            &LDCK, DK, &LDDK, RCOND, &TOL, IWORK, DWORK, &LDWORK,
            BWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10ZD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB10ZP(DISCFL::BlasInt, N::BlasInt, A::Array{Float64,1},
    LDA::Float64, B::Array{Float64,1}, C::Array{Float64,1},
    D::Array{Float64,1}, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb10zp_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &DISCFL, &N, A, &LDA, B, C, D, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB10ZP: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB16AD(DICO::Char, JOBC::Char, JOBO::Char, JOBMR::Char,
    WEIGHT::Char, EQUIL::Char, ORDSEL::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, NC::BlasInt, NCR::BlasInt, ALPHA::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, AC::Array{Float64,2},
    LDAC::BlasInt, BC::Array{Float64,2}, LDBC::BlasInt,
    CC::Array{Float64,2}, LDCC::BlasInt, DC::Array{Float64,2},
    LDDC::BlasInt, NCS::BlasInt, HSVC::Array{Float64,1},
    TOL1::Float64, TOL2::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:sb16ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOBC,
            &JOBO, &JOBMR, &WEIGHT, &EQUIL, &ORDSEL, &N, &M, &P,
            &NC, &NCR, &ALPHA, A, &LDA, B, &LDB, C, &LDC, D, &LDD,
            AC, &LDAC, BC, &LDBC, CC, &LDCC, DC, &LDDC, &NCS, HSVC,
            &TOL1, &TOL2, IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB16AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB16AY(DICO::Char, JOBC::Char, JOBO::Char, WEIGHT::Char,
    N::BlasInt, M::BlasInt, P::BlasInt, NC::BlasInt, NCS::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, AC::Array{Float64,2},
    LDAC::BlasInt, BC::Array{Float64,2}, LDBC::BlasInt,
    CC::Array{Float64,2}, LDCC::BlasInt, DC::Array{Float64,2},
    LDDC::BlasInt, SCALEC::Float64, SCALEO::Float64,
    S::Array{Float64,2}, LDS::BlasInt, R::Array{Float64,2},
    LDR::BlasInt, IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb16ay_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &DICO, &JOBC, &JOBO, &WEIGHT, &N, &M, &P,
            &NC, &NCS, A, &LDA, B, &LDB, C, &LDC, D, &LDD, AC,
            &LDAC, BC, &LDBC, CC, &LDCC, DC, &LDDC, &SCALEC,
            &SCALEO, S, &LDS, R, &LDR, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB16AY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB16BD(DICO::Char, JOBD::Char, JOBMR::Char, JOBCF::Char,
    EQUIL::Char, ORDSEL::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    NCR::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt,
    F::Array{Float64,2}, LDF::BlasInt, G::Array{Float64,2},
    LDG::BlasInt, DC::Array{Float64,2}, LDDC::BlasInt,
    HSV::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:sb16bd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOBD, &JOBMR,
            &JOBCF, &EQUIL, &ORDSEL, &N, &M, &P, &NCR, A, &LDA, B,
            &LDB, C, &LDC, D, &LDD, F, &LDF, G, &LDG, DC, &LDDC,
            HSV, &TOL1, &TOL2, IWORK, DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB16BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB16CD(DICO::Char, JOBD::Char, JOBMR::Char, JOBCF::Char,
    ORDSEL::Char, N::BlasInt, M::BlasInt, P::BlasInt, NCR::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, F::Array{Float64,2},
    LDF::BlasInt, G::Array{Float64,2}, LDG::BlasInt,
    HSV::Array{Float64,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, IWARN::BlasInt,
    INFO::BlasInt)

    ccall((:sb16cd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOBD, &JOBMR,
            &JOBCF, &ORDSEL, &N, &M, &P, &NCR, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, F, &LDF, G, &LDG, HSV, &TOL, IWORK,
            DWORK, &LDWORK, &IWARN, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB16CD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SB16CY(DICO::Char, JOBCF::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, F::Array{Float64,2}, LDF::BlasInt,
    G::Array{Float64,2}, LDG::BlasInt, SCALEC::Float64,
    SCALEO::Float64, S::Array{Float64,2}, LDS::BlasInt,
    R::Array{Float64,2}, LDR::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sb16cy_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOBCF, &N, &M, &P,
            A, &LDA, B, &LDB, C, &LDC, F, &LDF, G, &LDG, &SCALEC,
            &SCALEO, S, &LDS, R, &LDR, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SB16CY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SG02AD(DICO::Char, JOBB::Char, FACT::Char, UPLO::Char,
    JOBL::Char, SCAL::Char, SORT::Char, ACC::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    E::Array{Float64,2}, LDE::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, Q::Array{Float64,2}, LDQ::BlasInt,
    R::Array{Float64,2}, LDR::BlasInt, L::Array{Float64,2},
    LDL::BlasInt, RCONDU::Float64, X::Array{Float64,2}, LDX::BlasInt,
    ALFAR::Array{Float64,1}, ALFAI::Array{Float64,1},
    BETA::Array{Float64,1}, S::Array{Float64,2}, LDS::BlasInt,
    T::Array{Float64,2}, LDT::BlasInt, U::Array{Float64,2},
    LDU::BlasInt, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, BWORK::Array{Bool,1},
    IWARN::BlasInt, INFO::BlasInt)

    ccall((:sg02ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Bool}, Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &JOBB,
            &FACT, &UPLO, &JOBL, &SCAL, &SORT, &ACC, &N, &M, &P, A,
            &LDA, E, &LDE, B, &LDB, Q, &LDQ, R, &LDR, L, &LDL,
            &RCONDU, X, &LDX, ALFAR, ALFAI, BETA, S, &LDS, T, &LDT,
            U, &LDU, &TOL, IWORK, DWORK, &LDWORK, BWORK, &IWARN,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SG02AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SG03AD(DICO::Char, JOB::Char, FACT::Char, TRANS::Char,
    UPLO::Char, N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    E::Array{Float64,2}, LDE::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, Z::Array{Float64,2}, LDZ::BlasInt,
    X::Array{Float64,2}, LDX::BlasInt, SCALE::Float64, SEP::Float64,
    FERR::Float64, ALPHAR::Array{Float64,1}, ALPHAI::Array{Float64,1},
    BETA::Array{Float64,1}, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:sg03ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{Char}, Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &DICO, &JOB, &FACT, &TRANS, &UPLO, &N, A, &LDA, E, &LDE,
            Q, &LDQ, Z, &LDZ, X, &LDX, &SCALE, &SEP, &FERR, ALPHAR,
            ALPHAI, BETA, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SG03AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SG03AX(TRANS::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, E::Array{Float64,2}, LDE::BlasInt,
    X::Array{Float64,2}, LDX::BlasInt, SCALE::Float64, INFO::BlasInt)

    ccall((:sg03ax_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &TRANS, &N, A, &LDA, E, &LDE, X, &LDX, &SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SG03AX: the %dth argument had
        an illegal value", -INFO))
    end
end


function SG03AY(TRANS::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, E::Array{Float64,2}, LDE::BlasInt,
    X::Array{Float64,2}, LDX::BlasInt, SCALE::Float64, INFO::BlasInt)

    ccall((:sg03ay_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &TRANS, &N, A, &LDA, E, &LDE, X, &LDX, &SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SG03AY: the %dth argument had
        an illegal value", -INFO))
    end
end


function SG03BD(DICO::Char, FACT::Char, TRANS::Char, N::BlasInt,
    M::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    E::Array{Float64,2}, LDE::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, Z::Array{Float64,2}, LDZ::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, SCALE::Float64,
    ALPHAR::Array{Float64,1}, ALPHAI::Array{Float64,1},
    BETA::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:sg03bd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &DICO, &FACT, &TRANS, &N, &M, A, &LDA, E, &LDE, Q, &LDQ,
            Z, &LDZ, B, &LDB, &SCALE, ALPHAR, ALPHAI, BETA, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SG03BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function SG03BU(TRANS::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, E::Array{Float64,2}, LDE::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, SCALE::Float64,
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:sg03bu_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}), &TRANS, &N, A, &LDA, E, &LDE, B, &LDB,
            &SCALE, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SG03BU: the %dth argument had
        an illegal value", -INFO))
    end
end


function SG03BV(TRANS::Char, N::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, E::Array{Float64,2}, LDE::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, SCALE::Float64,
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:sg03bv_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}), &TRANS, &N, A, &LDA, E, &LDE, B, &LDB,
            &SCALE, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SG03BV: the %dth argument had
        an illegal value", -INFO))
    end
end


function SG03BW(TRANS::Char, M::BlasInt, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, E::Array{Float64,2}, LDE::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, X::Array{Float64,2},
    LDX::BlasInt, SCALE::Float64, INFO::BlasInt)

    ccall((:sg03bw_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}), &TRANS, &M, &N, A, &LDA, C, &LDC, E,
            &LDE, D, &LDD, X, &LDX, &SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SG03BW: the %dth argument had
        an illegal value", -INFO))
    end
end


function SG03BX(DICO::Char, TRANS::Char, A::Array{Float64,2},
    LDA::BlasInt, E::Array{Float64,2}, LDE::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, U::Array{Float64,2},
    LDU::BlasInt, SCALE::Float64, M1::Array{Float64,2}, LDM1::BlasInt,
    M2::Array{Float64,2}, LDM2::BlasInt, INFO::BlasInt)

    ccall((:sg03bx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &DICO, &TRANS, A, &LDA, E,
            &LDE, B, &LDB, U, &LDU, &SCALE, M1, &LDM1, M2, &LDM2,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in SG03BX: the %dth argument had
        an illegal value", -INFO))
    end
end


function SG03BY(XR::Float64, XI::Float64, YR::Float64, YI::Float64,
    CR::Float64, CI::Float64, SR::Float64, SI::Float64, Z::Float64)

    ccall((:sg03by_, "libslicot"), Void, (Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}), &XR, &XI,
            &YR, &YI, &CR, &CI, &SR, &SI, &Z)
    
    if INFO < 0
        error(@sprintf("SlicotError in SG03BY: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01ID(JOB::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    MAXRED::Float64, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, SCALE::Array{Float64,1}, INFO::BlasInt)

    ccall((:tb01id_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &JOB, &N, &M,
            &P, &MAXRED, A, &LDA, B, &LDB, C, &LDC, SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01ID: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01IZ(JOB::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    MAXRED::Float64, A::Array{Complex128,1}, LDA::Complex128,
    B::Array{Complex128,1}, LDB::Complex128, C::Array{Complex128,1},
    LDC::Complex128, SCALE::Array{Float64,1}, INFO::BlasInt)

    ccall((:tb01iz_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Float64}, Ptr{BlasInt}), &JOB, &N, &M, &P, &MAXRED,
            A, &LDA, B, &LDB, C, &LDC, SCALE, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01IZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01KD(DICO::Char, STDOM::Char, JOBA::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, ALPHA::Float64, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, NDIM::BlasInt,
    U::Array{Float64,2}, LDU::BlasInt, WR::Array{Float64,1},
    WI::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tb01kd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &DICO,
            &STDOM, &JOBA, &N, &M, &P, &ALPHA, A, &LDA, B, &LDB, C,
            &LDC, &NDIM, U, &LDU, WR, WI, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01KD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01LD(DICO::Char, STDOM::Char, JOBA::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, ALPHA::Float64, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, NDIM::BlasInt,
    U::Array{Float64,2}, LDU::BlasInt, WR::Array{Float64,1},
    WI::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tb01ld_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &DICO,
            &STDOM, &JOBA, &N, &M, &P, &ALPHA, A, &LDA, B, &LDB, C,
            &LDC, &NDIM, U, &LDU, WR, WI, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01LD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01MD(JOBU::Char, UPLO::Char, N::BlasInt, M::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, U::Array{Float64,2}, LDU::BlasInt,
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:tb01md_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}), &JOBU, &UPLO, &N, &M, A,
            &LDA, B, &LDB, U, &LDU, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01ND(JOBU::Char, UPLO::Char, N::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, U::Array{Float64,2}, LDU::BlasInt,
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:tb01nd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}), &JOBU, &UPLO, &N, &P, A,
            &LDA, C, &LDC, U, &LDU, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01PD(JOB::Char, EQUIL::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, NR::BlasInt, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tb01pd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &JOB, &EQUIL,
            &N, &M, &P, A, &LDA, B, &LDB, C, &LDC, &NR, &TOL, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01TD(N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, LOW::BlasInt, IGH::BlasInt,
    SCSTAT::Array{Float64,1}, SCIN::Array{Float64,1},
    SCOUT::Array{Float64,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:tb01td_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &N, &M, &P, A, &LDA, B, &LDB, C, &LDC, D, &LDD, &LOW,
            &IGH, SCSTAT, SCIN, SCOUT, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01TD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01TY(MODE::BlasInt, IOFF::BlasInt, JOFF::BlasInt,
    NROW::BlasInt, NCOL::BlasInt, SIZE::Float64, X::Array{Float64,2},
    LDX::BlasInt, BVECT::Array{Float64,1})

    ccall((:tb01ty_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}), &MODE, &IOFF,
            &JOFF, &NROW, &NCOL, &SIZE, X, &LDX, BVECT)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01TY: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01UD(JOBZ::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt, NCONT::BlasInt,
    INDCON::BlasInt, NBLK::Array{BlasInt,1}, Z::Array{Float64,2},
    LDZ::BlasInt, TAU::Array{Float64,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tb01ud_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &JOBZ, &N,
            &M, &P, A, &LDA, B, &LDB, C, &LDC, &NCONT, &INDCON,
            NBLK, Z, &LDZ, TAU, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01UD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01VD(APPLY::Char, N::BlasInt, M::BlasInt, L::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, X0::Array{Float64,1},
    THETA::Array{Float64,1}, LTHETA::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tb01vd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &APPLY, &N, &M, &L, A, &LDA, B, &LDB, C, &LDC, D, &LDD,
            X0, THETA, &LTHETA, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01VD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01VY(APPLY::Char, N::BlasInt, M::BlasInt, L::BlasInt,
    THETA::Array{Float64,1}, LTHETA::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, D::Array{Float64,2},
    LDD::BlasInt, X0::Array{Float64,1}, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tb01vy_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &APPLY, &N, &M, &L, THETA, &LTHETA, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, X0, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01VY: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01WD(N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    U::Array{Float64,2}, LDU::BlasInt, WR::Array{Float64,1},
    WI::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tb01wd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &P, A, &LDA, B,
            &LDB, C, &LDC, U, &LDU, WR, WI, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01WD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01XD(JOBD::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    KL::BlasInt, KU::BlasInt, A::Array{Float64,1}, LDA::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, D::Array{Float64,1}, LDD::Float64, INFO::BlasInt)

    ccall((:tb01xd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}), &JOBD, &N, &M, &P, &KL, &KU, A, &LDA, B,
            &LDB, C, &LDC, D, &LDD, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01XD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01XZ(JOBD::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    KL::BlasInt, KU::BlasInt, A::Array{Complex128,1}, LDA::Complex128,
    B::Array{Complex128,1}, LDB::Complex128, C::Array{Complex128,1},
    LDC::Complex128, D::Array{Complex128,1}, LDD::Complex128,
    INFO::BlasInt)

    ccall((:tb01xz_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{BlasInt}), &JOBD,
            &N, &M, &P, &KL, &KU, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01XZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01YD(N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,1}, LDA::Float64, B::Array{Float64,1},
    LDB::Float64, C::Array{Float64,1}, LDC::Float64, INFO::BlasInt)

    ccall((:tb01yd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &N, &M, &P, A, &LDA, B, &LDB, C, &LDC, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01YD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB01ZD(JOBZ::Char, N::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,1},
    C::Array{Float64,2}, LDC::BlasInt, NCONT::BlasInt,
    Z::Array{Float64,2}, LDZ::BlasInt, TAU::Array{Float64,1},
    TOL::Float64, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tb01zd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &JOBZ, &N, &P, A, &LDA, B,
            C, &LDC, &NCONT, Z, &LDZ, TAU, &TOL, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB01ZD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB03AD(LERI::Char, EQUIL::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt, NR::BlasInt,
    INDEX::Array{BlasInt,1}, PCOEFF::Array{Float64,3},
    LDPCO1::BlasInt, LDPCO2::BlasInt, QCOEFF::Array{Float64,3},
    LDQCO1::BlasInt, LDQCO2::BlasInt, VCOEFF::Array{Float64,3},
    LDVCO1::BlasInt, LDVCO2::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tb03ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &LERI,
            &EQUIL, &N, &M, &P, A, &LDA, B, &LDB, C, &LDC, D, &LDD,
            &NR, INDEX, PCOEFF, &LDPCO1, &LDPCO2, QCOEFF, &LDQCO1,
            &LDQCO2, VCOEFF, &LDVCO1, &LDVCO2, &TOL, IWORK, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB03AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB03AY(NR::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    INDBLK::BlasInt, NBLK::Array{BlasInt,1}, VCOEFF::Array{Float64,3},
    LDVCO1::BlasInt, LDVCO2::BlasInt, PCOEFF::Array{Float64,3},
    LDPCO1::BlasInt, LDPCO2::BlasInt, INFO::BlasInt)

    ccall((:tb03ay_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}), &NR, A, &LDA, &INDBLK,
            NBLK, VCOEFF, &LDVCO1, &LDVCO2, PCOEFF, &LDPCO1,
            &LDPCO2, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB03AY: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB04AD(ROWCOL::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, NR::BlasInt,
    INDEX::Array{BlasInt,1}, DCOEFF::Array{Float64,2},
    LDDCOE::BlasInt, UCOEFF::Array{Float64,3}, LDUCO1::BlasInt,
    LDUCO2::BlasInt, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tb04ad_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &ROWCOL, &N,
            &M, &P, A, &LDA, B, &LDB, C, &LDC, D, &LDD, &NR, INDEX,
            DCOEFF, &LDDCOE, UCOEFF, &LDUCO1, &LDUCO2, &TOL1, &TOL2,
            IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB04AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB04AY(N::BlasInt, MWORK::BlasInt, PWORK::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, NCONT::BlasInt,
    INDEXD::Array{BlasInt,1}, DCOEFF::Array{Float64,2},
    LDDCOE::BlasInt, UCOEFF::Array{Float64,3}, LDUCO1::BlasInt,
    LDUCO2::BlasInt, AT::Array{Float64,2}, N1::BlasInt,
    TAU::Array{Float64,1}, TOL1::Float64, TOL2::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tb04ay_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &N, &MWORK, &PWORK, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, &NCONT, INDEXD, DCOEFF, &LDDCOE, UCOEFF,
            &LDUCO1, &LDUCO2, AT, &N1, TAU, &TOL1, &TOL2, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB04AY: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB04BD(JOBD::Char, ORDER::Char, EQUIL::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, MD::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, D::Array{Float64,2},
    LDD::BlasInt, IGN::Array{BlasInt,2}, LDIGN::BlasInt,
    IGD::Array{BlasInt,2}, LDIGD::BlasInt, GN::Array{Float64,1},
    GD::Array{Float64,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tb04bd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &JOBD, &ORDER, &EQUIL, &N, &M, &P, &MD, A, &LDA, B,
            &LDB, C, &LDC, D, &LDD, IGN, &LDIGN, IGD, &LDIGD, GN,
            GD, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB04BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB04BV(ORDER::Char, P::BlasInt, M::BlasInt, MD::BlasInt,
    IGN::Array{BlasInt,2}, LDIGN::BlasInt, IGD::Array{BlasInt,2},
    LDIGD::BlasInt, GN::Array{Float64,1}, GD::Array{Float64,1},
    D::Array{Float64,2}, LDD::BlasInt, TOL::Float64, INFO::BlasInt)

    ccall((:tb04bv_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &ORDER, &P, &M, &MD, IGN, &LDIGN, IGD, &LDIGD, GN, GD,
            D, &LDD, &TOL, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB04BV: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB04BW(ORDER::Char, P::BlasInt, M::BlasInt, MD::BlasInt,
    IGN::Array{BlasInt,2}, LDIGN::BlasInt, IGD::Array{BlasInt,2},
    LDIGD::BlasInt, GN::Array{Float64,1}, GD::Array{Float64,1},
    D::Array{Float64,2}, LDD::BlasInt, INFO::BlasInt)

    ccall((:tb04bw_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &ORDER, &P,
            &M, &MD, IGN, &LDIGN, IGD, &LDIGD, GN, GD, D, &LDD,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB04BW: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB04BX(IP::BlasInt, IZ::BlasInt, A::Array{Float64,2},
    LDA::BlasInt, B::Array{Float64,1}, C::Array{Float64,1},
    D::Float64, PR::Array{Float64,1}, PI::Array{Float64,1},
    ZR::Array{Float64,1}, ZI::Array{Float64,1}, GAIN::Float64,
    IWORK::Array{BlasInt,1})

    ccall((:tb04bx_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &IP, &IZ, A,
            &LDA, B, C, &D, PR, PI, ZR, ZI, &GAIN, IWORK)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB04BX: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB04CD(JOBD::Char, EQUIL::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, NPZ::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt,
    NZ::Array{BlasInt,2}, LDNZ::BlasInt, NP::Array{BlasInt,2},
    LDNP::BlasInt, ZEROSR::Array{Float64,1}, ZEROSI::Array{Float64,1},
    POLESR::Array{Float64,1}, POLESI::Array{Float64,1},
    GAINS::Array{Float64,2}, LDGAIN::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tb04cd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &JOBD,
            &EQUIL, &N, &M, &P, &NPZ, A, &LDA, B, &LDB, C, &LDC, D,
            &LDD, NZ, &LDNZ, NP, &LDNP, ZEROSR, ZEROSI, POLESR,
            POLESI, GAINS, &LDGAIN, &TOL, IWORK, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB04CD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TB05AD(BALEIG::Char, INITA::Char, N::BlasInt, M::BlasInt,
    P::BlasInt, FREQ::Complex128, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, RCOND::Float64, G::Array{Complex128,2},
    LDG::BlasInt, EVRE::Array{Float64,1}, EVIM::Array{Float64,1},
    HINVB::Array{Complex128,2}, LDHINV::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    ZWORK::Array{Complex128,1}, LZWORK::BlasInt, INFO::BlasInt)

    ccall((:tb05ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Complex128},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{BlasInt}), &BALEIG,
            &INITA, &N, &M, &P, &FREQ, A, &LDA, B, &LDB, C, &LDC,
            &RCOND, G, &LDG, EVRE, EVIM, HINVB, &LDHINV, IWORK,
            DWORK, &LDWORK, ZWORK, &LZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TB05AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TC01OD(LERI::Char, M::BlasInt, P::BlasInt, INDLIM::BlasInt,
    PCOEFF::Array{Float64,3}, LDPCO1::BlasInt, LDPCO2::BlasInt,
    QCOEFF::Array{Float64,3}, LDQCO1::BlasInt, LDQCO2::BlasInt,
    INFO::BlasInt)

    ccall((:tc01od_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}), &LERI, &M, &P, &INDLIM, PCOEFF, &LDPCO1,
            &LDPCO2, QCOEFF, &LDQCO1, &LDQCO2, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TC01OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TC04AD(LERI::Char, M::BlasInt, P::BlasInt,
    INDEX::Array{BlasInt,1}, PCOEFF::Array{Float64,3},
    LDPCO1::BlasInt, LDPCO2::BlasInt, QCOEFF::Array{Float64,3},
    LDQCO1::BlasInt, LDQCO2::BlasInt, N::BlasInt, RCOND::Float64,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tc04ad_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &LERI, &M, &P, INDEX,
            PCOEFF, &LDPCO1, &LDPCO2, QCOEFF, &LDQCO1, &LDQCO2, &N,
            &RCOND, A, &LDA, B, &LDB, C, &LDC, D, &LDD, IWORK,
            DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TC04AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TC05AD(LERI::Char, M::BlasInt, P::BlasInt, SVAL::Complex128,
    INDEX::Array{BlasInt,1}, PCOEFF::Array{Float64,3},
    LDPCO1::BlasInt, LDPCO2::BlasInt, QCOEFF::Array{Float64,3},
    LDQCO1::BlasInt, LDQCO2::BlasInt, RCOND::Float64,
    CFREQR::Array{Complex128,2}, LDCFRE::BlasInt,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1},
    ZWORK::Array{Complex128,1}, INFO::BlasInt)

    ccall((:tc05ad_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Complex128}, Ptr{BlasInt}), &LERI, &M,
            &P, &SVAL, INDEX, PCOEFF, &LDPCO1, &LDPCO2, QCOEFF,
            &LDQCO1, &LDQCO2, &RCOND, CFREQR, &LDCFRE, IWORK, DWORK,
            ZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TC05AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TD03AD(ROWCOL::Char, LERI::Char, EQUIL::Char, M::BlasInt,
    P::BlasInt, INDEXD::Array{BlasInt,1}, DCOEFF::Array{Float64,2},
    LDDCOE::BlasInt, UCOEFF::Array{Float64,3}, LDUCO1::BlasInt,
    LDUCO2::BlasInt, NR::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt,
    INDEXP::Array{BlasInt,1}, PCOEFF::Array{Float64,3},
    LDPCO1::BlasInt, LDPCO2::BlasInt, QCOEFF::Array{Float64,3},
    LDQCO1::BlasInt, LDQCO2::BlasInt, VCOEFF::Array{Float64,3},
    LDVCO1::BlasInt, LDVCO2::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:td03ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &ROWCOL, &LERI, &EQUIL, &M, &P, INDEXD,
            DCOEFF, &LDDCOE, UCOEFF, &LDUCO1, &LDUCO2, &NR, A, &LDA,
            B, &LDB, C, &LDC, D, &LDD, INDEXP, PCOEFF, &LDPCO1,
            &LDPCO2, QCOEFF, &LDQCO1, &LDQCO2, VCOEFF, &LDVCO1,
            &LDVCO2, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TD03AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TD03AY(MWORK::BlasInt, PWORK::BlasInt,
    INDEX::Array{BlasInt,1}, DCOEFF::Array{Float64,2},
    LDDCOE::BlasInt, UCOEFF::Array{Float64,3}, LDUCO1::BlasInt,
    LDUCO2::BlasInt, N::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt, INFO::BlasInt)

    ccall((:td03ay_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &MWORK, &PWORK, INDEX, DCOEFF, &LDDCOE, UCOEFF, &LDUCO1,
            &LDUCO2, &N, A, &LDA, B, &LDB, C, &LDC, D, &LDD, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TD03AY: the %dth argument had
        an illegal value", -INFO))
    end
end


function TD04AD(ROWCOL::Char, M::BlasInt, P::BlasInt,
    INDEX::Array{BlasInt,1}, DCOEFF::Array{Float64,2},
    LDDCOE::BlasInt, UCOEFF::Array{Float64,3}, LDUCO1::BlasInt,
    LDUCO2::BlasInt, NR::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:td04ad_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &ROWCOL, &M, &P, INDEX, DCOEFF, &LDDCOE,
            UCOEFF, &LDUCO1, &LDUCO2, &NR, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TD04AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TD05AD(UNITF::Char, OUTPUT::Char, NP1::BlasInt, MP1::BlasInt,
    W::Float64, A::Array{Float64,1}, B::Array{Float64,1},
    VALR::Float64, VALI::Float64, INFO::BlasInt)

    ccall((:td05ad_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &UNITF, &OUTPUT, &NP1, &MP1, &W, A, B, &VALR, &VALI,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TD05AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TF01MD(N::BlasInt, M::BlasInt, P::BlasInt, NY::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, U::Array{Float64,2},
    LDU::BlasInt, X::Array{Float64,1}, Y::Array{Float64,2},
    LDY::BlasInt, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:tf01md_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}), &N, &M, &P, &NY, A, &LDA, B, &LDB, C,
            &LDC, D, &LDD, U, &LDU, X, Y, &LDY, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TF01MD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TF01MX(N::BlasInt, M::BlasInt, P::BlasInt, NY::BlasInt,
    S::Array{Float64,2}, LDS::BlasInt, U::Array{Float64,2},
    LDU::BlasInt, X::Array{Float64,1}, Y::Array{Float64,2},
    LDY::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tf01mx_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &N, &M, &P, &NY, S, &LDS, U, &LDU, X, Y, &LDY, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TF01MX: the %dth argument had
        an illegal value", -INFO))
    end
end


function TF01MY(N::BlasInt, M::BlasInt, P::BlasInt, NY::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    D::Array{Float64,2}, LDD::BlasInt, U::Array{Float64,2},
    LDU::BlasInt, X::Array{Float64,1}, Y::Array{Float64,2},
    LDY::BlasInt, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tf01my_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &P, &NY, A, &LDA,
            B, &LDB, C, &LDC, D, &LDD, U, &LDU, X, Y, &LDY, DWORK,
            &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TF01MY: the %dth argument had
        an illegal value", -INFO))
    end
end


function TF01ND(UPLO::Char, N::BlasInt, M::BlasInt, P::BlasInt,
    NY::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    B::Array{Float64,2}, LDB::BlasInt, C::Array{Float64,2},
    LDC::BlasInt, D::Array{Float64,2}, LDD::BlasInt,
    U::Array{Float64,2}, LDU::BlasInt, X::Array{Float64,1},
    Y::Array{Float64,2}, LDY::BlasInt, DWORK::Array{Float64,1},
    INFO::BlasInt)

    ccall((:tf01nd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}), &UPLO, &N, &M, &P, &NY, A,
            &LDA, B, &LDB, C, &LDC, D, &LDD, U, &LDU, X, Y, &LDY,
            DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TF01ND: the %dth argument had
        an illegal value", -INFO))
    end
end


function TF01OD(NH1::BlasInt, NH2::BlasInt, NR::BlasInt, NC::BlasInt,
    H::Array{Float64,2}, LDH::BlasInt, T::Array{Float64,2},
    LDT::BlasInt, INFO::BlasInt)

    ccall((:tf01od_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &NH1, &NH2,
            &NR, &NC, H, &LDH, T, &LDT, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TF01OD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TF01PD(NH1::BlasInt, NH2::BlasInt, NR::BlasInt, NC::BlasInt,
    H::Array{Float64,2}, LDH::BlasInt, T::Array{Float64,2},
    LDT::BlasInt, INFO::BlasInt)

    ccall((:tf01pd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &NH1, &NH2,
            &NR, &NC, H, &LDH, T, &LDT, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TF01PD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TF01QD(NC::BlasInt, NB::BlasInt, N::BlasInt,
    IORD::Array{BlasInt,1}, AR::Array{Float64,1},
    MA::Array{Float64,1}, H::Array{Float64,2}, LDH::BlasInt,
    INFO::BlasInt)

    ccall((:tf01qd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &NC, &NB, &N,
            IORD, AR, MA, H, &LDH, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TF01QD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TF01RD(NA::BlasInt, NB::BlasInt, NC::BlasInt, N::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt,
    H::Array{Float64,2}, LDH::BlasInt, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tf01rd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &NA, &NB, &NC, &N, A, &LDA, B, &LDB, C,
            &LDC, H, &LDH, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TF01RD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01AD(JOB::Char, L::BlasInt, N::BlasInt, M::BlasInt,
    P::BlasInt, THRESH::Float64, A::Array{Float64,1}, LDA::Float64,
    E::Array{Float64,1}, LDE::Float64, B::Array{Float64,1},
    LDB::Float64, C::Array{Float64,1}, LDC::Float64,
    LSCALE::Array{Float64,1}, RSCALE::Array{Float64,1},
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:tg01ad_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}),
            &JOB, &L, &N, &M, &P, &THRESH, A, &LDA, E, &LDE, B,
            &LDB, C, &LDC, LSCALE, RSCALE, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01AD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01AZ(JOB::Char, L::BlasInt, N::BlasInt, M::BlasInt,
    P::BlasInt, THRESH::Float64, A::Array{Complex128,1},
    LDA::Complex128, E::Array{Complex128,1}, LDE::Complex128,
    B::Array{Complex128,1}, LDB::Complex128, C::Array{Complex128,1},
    LDC::Complex128, LSCALE::Array{Float64,1},
    RSCALE::Array{Float64,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:tg01az_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}), &JOB, &L, &N,
            &M, &P, &THRESH, A, &LDA, E, &LDE, B, &LDB, C, &LDC,
            LSCALE, RSCALE, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01AZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01BD(JOBE::Char, COMPQ::Char, COMPZ::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, ILO::BlasInt, IHI::BlasInt,
    A::Array{Float64,1}, LDA::Float64, E::Array{Float64,1},
    LDE::Float64, B::Array{Float64,1}, LDB::Float64,
    C::Array{Float64,1}, LDC::Float64, Q::Array{Float64,1},
    LDQ::Float64, Z::Array{Float64,1}, LDZ::Float64,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tg01bd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOBE, &COMPQ, &COMPZ, &N, &M, &P, &ILO,
            &IHI, A, &LDA, E, &LDE, B, &LDB, C, &LDC, Q, &LDQ, Z,
            &LDZ, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01BD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01CD(COMPQ::Char, L::BlasInt, N::BlasInt, M::BlasInt,
    A::Array{Float64,1}, LDA::Float64, E::Array{Float64,1},
    LDE::Float64, B::Array{Float64,1}, LDB::Float64,
    Q::Array{Float64,1}, LDQ::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tg01cd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &COMPQ, &L, &N, &M, A, &LDA, E, &LDE, B,
            &LDB, Q, &LDQ, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01CD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01DD(COMPZ::Char, L::BlasInt, N::BlasInt, P::BlasInt,
    A::Array{Float64,1}, LDA::Float64, E::Array{Float64,1},
    LDE::Float64, C::Array{Float64,1}, LDC::Float64,
    Z::Array{Float64,1}, LDZ::Float64, DWORK::Array{Float64,1},
    LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tg01dd_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &COMPZ, &L, &N, &P, A, &LDA, E, &LDE, C,
            &LDC, Z, &LDZ, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01DD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01ED(JOBA::Char, L::BlasInt, N::BlasInt, M::BlasInt,
    P::BlasInt, A::Array{Float64,1}, LDA::Float64,
    E::Array{Float64,1}, LDE::Float64, B::Array{Float64,1},
    LDB::Float64, C::Array{Float64,1}, LDC::Float64,
    Q::Array{Float64,1}, LDQ::Float64, Z::Array{Float64,1},
    LDZ::Float64, RANKE::BlasInt, RNKA22::BlasInt, TOL::Float64,
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tg01ed_, "libslicot"), Void, (Ptr{Char}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}), &JOBA, &L, &N, &M, &P, A, &LDA, E, &LDE,
            B, &LDB, C, &LDC, Q, &LDQ, Z, &LDZ, &RANKE, &RNKA22,
            &TOL, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01ED: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01FD(COMPQ::Char, COMPZ::Char, JOBA::Char, L::BlasInt,
    N::BlasInt, M::BlasInt, P::BlasInt, A::Array{Float64,1},
    LDA::Float64, E::Array{Float64,1}, LDE::Float64,
    B::Array{Float64,1}, LDB::Float64, C::Array{Float64,1},
    LDC::Float64, Q::Array{Float64,1}, LDQ::Float64,
    Z::Array{Float64,1}, LDZ::Float64, RANKE::BlasInt,
    RNKA22::BlasInt, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tg01fd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}),
            &COMPQ, &COMPZ, &JOBA, &L, &N, &M, &P, A, &LDA, E, &LDE,
            B, &LDB, C, &LDC, Q, &LDQ, Z, &LDZ, &RANKE, &RNKA22,
            &TOL, IWORK, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01FD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01FZ(COMPQ::Char, COMPZ::Char, JOBA::Char, L::BlasInt,
    N::BlasInt, M::BlasInt, P::BlasInt, A::Array{Complex128,1},
    LDA::Complex128, E::Array{Complex128,1}, LDE::Complex128,
    B::Array{Complex128,1}, LDB::Complex128, C::Array{Complex128,1},
    LDC::Complex128, Q::Array{Complex128,1}, LDQ::Complex128,
    Z::Array{Complex128,1}, LDZ::Complex128, RANKE::BlasInt,
    RNKA22::BlasInt, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, ZWORK::Array{Complex128,1},
    LZWORK::BlasInt, INFO::BlasInt)

    ccall((:tg01fz_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Complex128}, Ptr{Complex128}, Ptr{Complex128},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{Complex128}, Ptr{BlasInt}, Ptr{BlasInt}), &COMPQ,
            &COMPZ, &JOBA, &L, &N, &M, &P, A, &LDA, E, &LDE, B,
            &LDB, C, &LDC, Q, &LDQ, Z, &LDZ, &RANKE, &RNKA22, &TOL,
            IWORK, DWORK, ZWORK, &LZWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01FZ: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01HD(JOBCON::Char, COMPQ::Char, COMPZ::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, A::Array{Float64,1}, LDA::Float64,
    E::Array{Float64,1}, LDE::Float64, B::Array{Float64,1},
    LDB::Float64, C::Array{Float64,1}, LDC::Float64,
    Q::Array{Float64,1}, LDQ::Float64, Z::Array{Float64,1},
    LDZ::Float64, NCONT::BlasInt, NIUCON::BlasInt, NRBLCK::BlasInt,
    RTAU::Array{BlasInt,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:tg01hd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &JOBCON, &COMPQ, &COMPZ, &N, &M, &P, A, &LDA, E, &LDE,
            B, &LDB, C, &LDC, Q, &LDQ, Z, &LDZ, &NCONT, &NIUCON,
            &NRBLCK, RTAU, &TOL, IWORK, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01HD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01HX(COMPQ::Char, COMPZ::Char, L::BlasInt, N::BlasInt,
    M::BlasInt, P::BlasInt, N1::BlasInt, LBE::BlasInt,
    A::Array{Float64,1}, LDA::Float64, E::Array{Float64,1},
    LDE::Float64, B::Array{Float64,1}, LDB::Float64,
    C::Array{Float64,1}, LDC::Float64, Q::Array{Float64,1},
    LDQ::Float64, Z::Array{Float64,1}, LDZ::Float64, NR::BlasInt,
    NRBLCK::BlasInt, RTAU::Array{BlasInt,1}, TOL::Float64,
    IWORK::Array{BlasInt,1}, DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:tg01hx_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}), &COMPQ, &COMPZ, &L, &N, &M, &P, &N1,
            &LBE, A, &LDA, E, &LDE, B, &LDB, C, &LDC, Q, &LDQ, Z,
            &LDZ, &NR, &NRBLCK, RTAU, &TOL, IWORK, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01HX: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01ID(JOBOBS::Char, COMPQ::Char, COMPZ::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, A::Array{Float64,1}, LDA::Float64,
    E::Array{Float64,1}, LDE::Float64, B::Array{Float64,1},
    LDB::Float64, C::Array{Float64,1}, LDC::Float64,
    Q::Array{Float64,1}, LDQ::Float64, Z::Array{Float64,1},
    LDZ::Float64, NOBSV::BlasInt, NIUOBS::BlasInt, NLBLCK::BlasInt,
    CTAU::Array{BlasInt,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, INFO::BlasInt)

    ccall((:tg01id_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}),
            &JOBOBS, &COMPQ, &COMPZ, &N, &M, &P, A, &LDA, E, &LDE,
            B, &LDB, C, &LDC, Q, &LDQ, Z, &LDZ, &NOBSV, &NIUOBS,
            &NLBLCK, CTAU, &TOL, IWORK, DWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01ID: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01JD(JOB::Char, SYSTYP::Char, EQUIL::Char, N::BlasInt,
    M::BlasInt, P::BlasInt, A::Array{Float64,2}, LDA::BlasInt,
    E::Array{Float64,2}, LDE::BlasInt, B::Array{Float64,2},
    LDB::BlasInt, C::Array{Float64,2}, LDC::BlasInt, NR::BlasInt,
    INFRED::Array{BlasInt,1}, TOL::Float64, IWORK::Array{BlasInt,1},
    DWORK::Array{Float64,1}, LDWORK::BlasInt, INFO::BlasInt)

    ccall((:tg01jd_, "libslicot"), Void, (Ptr{Char}, Ptr{Char},
            Ptr{Char}, Ptr{BlasInt}, Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &JOB,
            &SYSTYP, &EQUIL, &N, &M, &P, A, &LDA, E, &LDE, B, &LDB,
            C, &LDC, &NR, INFRED, &TOL, IWORK, DWORK, &LDWORK,
            &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01JD: the %dth argument had
        an illegal value", -INFO))
    end
end


function TG01WD(N::BlasInt, M::BlasInt, P::BlasInt,
    A::Array{Float64,2}, LDA::BlasInt, E::Array{Float64,2},
    LDE::BlasInt, B::Array{Float64,2}, LDB::BlasInt,
    C::Array{Float64,2}, LDC::BlasInt, Q::Array{Float64,2},
    LDQ::BlasInt, Z::Array{Float64,2}, LDZ::BlasInt,
    ALPHAR::Array{Float64,1}, ALPHAI::Array{Float64,1},
    BETA::Array{Float64,1}, DWORK::Array{Float64,1}, LDWORK::BlasInt,
    INFO::BlasInt)

    ccall((:tg01wd_, "libslicot"), Void, (Ptr{BlasInt}, Ptr{BlasInt},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{BlasInt}, Ptr{Float64},
            Ptr{BlasInt}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
            Ptr{Float64}, Ptr{BlasInt}, Ptr{BlasInt}), &N, &M, &P,
            A, &LDA, E, &LDE, B, &LDB, C, &LDC, Q, &LDQ, Z, &LDZ,
            ALPHAR, ALPHAI, BETA, DWORK, &LDWORK, &INFO)
    
    if INFO < 0
        error(@sprintf("SlicotError in TG01WD: the %dth argument had
        an illegal value", -INFO))
    end
end

end     #module
