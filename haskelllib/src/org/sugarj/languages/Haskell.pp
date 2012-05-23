[
   NewTypeDecl                     -- KW["newtype"] _1 _2 KW["="] _3 _4,
   NewTypeDecl.1:opt               -- _1,
   CharHash                        -- H hs=0 [KW["'"] _1 KW["'"] KW["#"]],
   StringHash                      -- H hs=0 [KW["\""] _1 KW["\""] KW["#"]],
   StringHash.1:iter-star          -- _1,
   IntegerHash                     -- H hs=0 [_1 KW["#"]],
   IntegerHash.1:lex               -- _1,
   FloatHash                       -- H hs=0 [_1 KW["#"]],
   FloatHash.1:lex                 -- _1,
   FloatHash                       -- H hs=0 [_1 KW["#"]],
   FloatHash.1:lex                 -- _1,
   Class                           -- _1 KW["("] _2 KW[")"],
   Class                           -- _1 _2,
   SimpleClass                     -- _1 _2,
   FlexibleContext                 -- _1 KW["=>"],
   FlexibleContext                 -- KW["("] _1 KW[")"] KW["=>"],
   FlexibleContext.1:iter-star-sep -- _1 KW[","],
   FlexibleInstance                -- KW["instance"] _1 _2 _3 _4,
   FlexibleInstance.1:opt          -- _1,
   FlexibleInstance.3:iter-star    -- _1,
   BindStmt                        -- _1 KW["<-"] _2,
   ExpStmt                         -- _1,
   LetStmt                         -- KW["let"] _1,
   FBind                           -- _1 KW["="] _2,
   StmtList                        -- _1,
   StmtList                        -- _1,
   StmtSeq                         -- V[H[_1 KW[";"]] H[_2]],
   List                            -- KW["["] _1 KW["]"],
   QualBind                        -- _1 KW["<-"] _2,
   QualLet                         -- KW["let"] _1,
   BinOpApp                        -- KW["("] _1 _2 _3 KW[")"],
   Negation                        -- KW["("] KW["-"] _1 KW[")"],
   ConstrApp                       -- _1 _2,
   ConstrApp.2:iter                -- _1,
   Named                           -- KW["("] _1 KW["@"] _2 KW[")"],
   Constr                          -- _1,
   Labeled                         -- _1 _2,
   LabeledPats                     -- KW["{"] _1 KW["}"],
   LabeledPats.1:iter-star-sep     -- _1 KW[","],
   Wildcard                        -- KW["_"],
   Tuple                           -- KW["("] _1 KW[","] _2 KW[")"],
   Tuple.2:iter-sep                -- _1 KW[","],
   List                            -- KW["["] _1 KW["]"],
   List.1:iter-sep                 -- _1 KW[","],
   Irrefutable                     -- KW["~"] _1,
   PatBind                         -- _1 KW["="] _2,
   Valdef                          -- _1 KW["="] _2 _3,
   GdValdef                        -- _1 _2 _3,
   GdValdef.2:iter                 -- _1,
   Guarded                         -- KW["|"] _1 KW["="] _2,
   VarFunLHS                       -- _1 _2,
   VarFunLHS.2:iter                -- _1,
   OpFunLHS                        -- _1 _2 _3,
   NestedFunLHS                    -- KW["("] _1 KW[")"] _2,
   NestedFunLHS.2:iter             -- _1,
   Where                           -- KW[" where"] _1,
   DeclList                        -- KW["{"] _1 KW["}"],
   DeclList.1:alt                  -- _1 _2,
   DeclSeq                         -- V[H[_1 KW[";"]] H[_2]],
   Alt                             -- _1 KW["->"] _2 _3,
   GdAlt                           -- _1 _2 _3,
   GdAlt.2:iter                    -- _1,
   GdPat                           -- KW["|"] _1 KW["->"] _2,
   AltList                         -- KW["{"] _1 KW["}"],
   AltSeq                          -- V[H[_1 KW[";"]] H[_2]],
   Var                             -- _1,
   Constr                          -- _1,
   Lit                             -- _1,
   Product                         -- KW["("] _1 KW[")"],
   Cons                            -- _1 KW[","] _2,
   Cons.2:iter-sep                 -- _1 KW[","],
   Infix                           -- KW["infix"],
   InfixL                          -- KW["infixl"],
   InfixR                          -- KW["infixr"],
   FixDecl                         -- _1 _2 _3,
   LSection                        -- KW["("] _1 _2 KW[")"],
   RSection                        -- KW["("] _1 _2 KW[")"],
   LabelBinds                      -- KW["{"] _1 KW["}"],
   LabelBinds.1:iter-star-sep      -- _1 KW[","],
   AppBin                          -- KW["("] _1 _2 KW[")"],
   Typed                           -- KW["("] _1 KW["::"] _2 KW[")"],
   OpApp                           -- KW["("] _1 _2 _3 KW[")"],
   Abs                             -- KW["("] KW["\\"] _1 KW["->"] _2 KW[")"],
   Let                             -- KW["("] KW["let"] _1 KW["in"] _2 KW[")"],
   If                              -- KW["("] KW["if"] _1 KW["then"] _2 KW["else"] _3 KW[")"],
   Do                              -- KW["("] KW["do"] KW["{"] _1 KW["}"] KW[")"],
   Case                            -- KW["("] KW["case"] _1 KW["of"] _2 KW[")"],
   SignDecl                        -- _1 KW["::"] _2 _3,
   SignDecl.2:opt                  -- _1,
   Class                           -- KW["class"] _1 _2 _3 _4,
   Class.1:opt                     -- _1,
   Instance                        -- KW["instance"] _1 _2 _3 _4,
   Instance.1:opt                  -- _1,
   Instance.3:iter-star            -- _1,
   Default                         -- KW["default"] KW["("] _1 KW[")"],
   Default.1:iter-star-sep         -- _1 KW[","],
   InstCons                        -- _1,
   InstApp                         -- KW["("] _1 _2 KW[")"],
   InstApp.2:iter-star             -- _1,
   InstTuple                       -- KW["("] _1 KW[","] _2 KW[")"],
   InstTuple.2:iter-sep            -- _1 KW[","],
   InstList                        -- KW["["] _1 KW["]"],
   InstArrow                       -- KW["("] _1 KW["->"] _2 KW[")"],
   Context                         -- _1 KW["=>"],
   Context                         -- KW["("] _1 KW[")"] KW["=>"],
   Context.1:iter-star-sep         -- _1 KW[","],
   SContext                        -- KW["("] _1 KW[")"] KW["=>"],
   SContext.1:iter-star-sep        -- _1 KW[","],
   SimpleClass                     -- _1 _2,
   Class                           -- _1 KW["("] _2 _3 KW[")"],
   Class.3:iter                    -- _1,
   TypeDecl                        -- KW["type"] _1 _2 KW["="] _3,
   TypeDecl.2:iter-star            -- _1,
   Data                            -- KW["data"] _1 _2 KW["="] _3 _4,
   Data.1:opt                      -- _1,
   NewTypeDecl                     -- KW["newtype"] _1 _2 KW["="] _3 _4,
   NewTypeDecl.1:opt               -- _1,
   Derive                          -- KW["deriving"] _1,
   NoDeriving                      -- KW["deriving"] KW["("] KW[")"],
   Derive                          -- KW["deriving"] KW["("] _1 KW[")"],
   Derive.1:iter-sep               -- _1 KW[","],
   NoDeriving                      -- ,
   ConstrDecl                      -- _1 _2,
   ConstrDecl.2:iter-star          -- _1,
   InfixConstr                     -- _1 _2 _3,
   LabeledConstr                   -- KW["{"] _1 KW["::"] _2 KW["}"],
   RecordConstr                    -- _1 _2 _3,
   RecordConstr.1:opt              -- _1,
   TArrow                          -- KW["("] KW["->"] KW[")"],
   Cons                            -- _1 KW[","] _2,
   Cons.2:iter-sep                 -- _1 KW[","],
   TCon                            -- _1,
   TVar                            -- _1,
   TList                           -- KW["["] _1 KW["]"],
   TProd                           -- KW["("] _1 KW[")"],
   TAppBin                         -- KW["("] _1 _2 KW[")"],
   TFunBin                         -- KW["("] _1 KW["->"] _2 KW[")"] ,
   TUnit                           -- KW["("] KW[")"],
   TList                           -- KW["["] KW["]"],
   TProduct                        -- V  [V vs=2 [KW["("] _1] KW[")"]],
   TProduct.1:iter                 -- KW[","],
   Exportlist                      -- _1,
   Exportlist.1:iter-star-sep      -- _1 KW[","],
   ExportAllSub	                   -- _1 KW["(..)"],
   ExportNoSub	                   -- _1 KW["( )"],
   ExportSomeSub	               -- _1 KW["("] _2 KW[")"],
   ExportSomeSub.2:iter-start-sep  -- KW[","],
   ExportModule  	               -- KW["module"] _1,
   Import                          -- KW["import"] _1 _2 _3 _4 _5,
   Import.1:opt                    -- _1,
   Import.2:opt                    -- _1,
   Import.4:opt                    -- _1,
   Import.5:opt                    -- _1,
   Impspec                         -- KW["("] _1 KW[")"],
   SOURCE                          -- KW["{-# SOURCE"] KW["#-}"],
   Qualified                       -- KW["qualified"],
   As                              -- KW["as"] _1,
   Hiding                          -- KW["hiding"] KW["("] _1 KW[")"],
   Module                          -- KW["module"] _1 _2 KW["where"] _3,
   Module.2:opt                    -- _1,
   Program                         -- _1,
   Empty                           -- KW[""],
   Body                            -- _1 _2,
   Body                            -- _1 _2,
   Body                            -- _1 _2,
   Body                            -- _1 KW[";"] _2,
   Body                            -- _1 _2,
   Body                            -- _1 _2,
   Body                            -- _1 _2,
   Body                            -- _1 _2,
   ImportdeclSeq                   -- V[H[_1 KW[";"]] H[_2]],
   TopdeclSeq                      -- V[H[_1 KW[";"]] H[_2]],
   Int                             -- _1,
   Float                           -- _1,
   Float                           -- _1,
   PrimInt                         -- _1,
   PrimChar                        -- _1,
   PrimString                      -- _1,
   PrimFloat                       -- _1,
   PrimDouble                      -- _1,
   CLitLit                         -- _1,
   Char                            -- H hs=0 [KW["'"] _1 KW["'"]],
   String                          -- H hs=0 [KW["\""] _1 KW["\""]],
   String.1:iter-star              -- _1,
   Escape                          -- H hs=0 [KW["\\"] _1],
   Gap                             -- H hs=0 [KW["\\"] _1 KW["\\"]],
   Gap.1:iter                      -- _1,
   CharEsc                         -- _1,
   CharEsc.1:lex                   -- _1,
   ASCIIEsc                        -- _1,
   ASCIIEsc.1:lex                  -- _1,
   DecimalEsc                      -- _1,
   DecimalEsc.1:lex                -- _1,
   OctalEsc                        -- H hs=0 [KW["o"] _1],
   OctalEsc.1:lex                  -- _1,
   HexadecimalEsc                  -- H hs=0 [KW["x"] _1],
   HexadecimalEsc.1:lex            -- _1,
   Snoc                            -- _1 KW[","] _2,
   Ins                             -- _1,
   Unit                            -- KW["("] KW[")"],
   EmptyList                       -- KW["["] KW["]"],
   ProductCon                         -- V  [V vs=2 [KW["("] _1] KW[")"]],
   ProductCon.1:iter                  -- KW[","],
   Var                             -- _1,
   Op                              -- _1,
   ConOp                           -- _1,
   ConsOp                          -- _1,
   BinOp                           -- KW["("] _1 KW[")"],
   BinOp                           -- KW["("] _1 KW[")"],
   BinCon                          -- KW["("] _1 KW[")"],
   BinCon                          -- KW["("] _1 KW[")"],
   PrefOp                          -- KW["`"] _1 KW["`"],
   PrefOp                          -- KW["`"] _1 KW["`"],
   PrefCon                         -- KW["`"] _1 KW["`"],
   PrefCon                         -- KW["`"] _1 KW["`"],
   ConId                           -- _1,
   QVarId                          -- H hs=0 [_1 KW["."] _2],
   QVarId.2:lex                    -- _1,
   QConId                          -- H hs=0 [_1 KW["."] _2],
   QConId.2:lex                    -- _1,
   QVarSym                         -- H hs=0 [_1 KW["."] _2],
   QVarSym.2:lex                   -- _1,
   QConSym                         -- H hs=0 [_1 KW["."] _2],
   QConSym.2:lex                   -- _1,
   QModId                          -- H hs=0 [_1 KW["."] _2],
   QModId.1:lex                    -- _1,
   QModId.2:lex                    -- _1,
   QModId                          -- H hs=0 [_1 KW["."] _2],
   QModId.1:lex                    -- _1,
   CompilationUnit                 -- V[_1 _2 _3],
   CompilationUnit.2:iter-star     -- _1,
   CompilationUnit.3:iter-star     -- _1,
   ModuleDec                       -- H[KW["module"] _1 _2 KW["where"]],
   ModuleDec.2:opt                 -- _1,
   NextToplevelDeclaration         -- _1 _2,
   grammar-elem                    -- _1,
   transformation-elem             -- _1,
   sorts                           -- KW["sorts"] _1,
   syntax                          -- KW["syntax"] _1,
   lexical-syntax                  -- KW["lexical"] KW["syntax"] _1,
   context-free-syntax             -- KW["context-free"] KW["syntax"] _1,
   variables                       -- KW["variables"] _1,
   lexical-variables               -- KW["lexical"] KW["variables"] _1,
   priorities                      -- KW["priorities"] _1,
   lexical-priorities              -- KW["lexical"] KW["priorities"] _1,
   context-free-priorities         -- KW["context-free"] KW["priorities"] _1,
   restrictions                    -- KW["restrictions"] _1,
   lexical-restrictions            -- KW["lexical"] KW["restrictions"] _1,
   context-free-restrictions       -- KW["context-free"] KW["restrictions"] _1,
   aliases                         -- KW["aliases"] _1,
   Strategies                      -- V  [H  [KW["strategies"]] _1],
   Strategies.1:iter-star          -- _1,
   Signature                       -- V  [H  [KW["signature"]] _1],
   Signature.1:iter-star           -- _1,
   Rules                           -- V  [H  [KW["rules"]] _1],
   Rules.1:iter-star               -- _1,
   Overlays                        -- V  [H  [KW["overlays"]] _1],
   Overlays.1:iter-star            -- _1,
   Desugarings                     -- V  [H  [KW["desugarings"]] _1],
   Desugarings.1:iter-star         -- _1,
   PureDesugaring                  -- _1,
   InjectDesugaring                -- _1 KW[":"] _2 KW["->"] _3 _4,
   Some                            -- _1,
   None                            -- KW[""],
   amb                             -- KW["amb"] KW["("] _1 KW[")"]
]
