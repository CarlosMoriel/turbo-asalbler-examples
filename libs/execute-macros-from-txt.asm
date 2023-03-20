  
include only-macros-example.txt

.model small
.stack
.data
    t1 db 'Soy una macro xd$',10,13
    t2 db 'Soy un texto xv$',10,13
    
.code
    .startup
    
    mLimpia
    
    mPosrc 5,6
    mImprimirC t1
    
    mPosrc 7,6
    mImprimirC t2
    
    mPausa
    
    .exit
    
end
