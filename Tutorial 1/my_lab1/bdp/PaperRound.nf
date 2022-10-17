Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(paperRound))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(paperRound))==(Machine(paperRound));
  Level(Machine(paperRound))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(paperRound)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(paperRound))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(paperRound))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(paperRound))==(?);
  List_Includes(Machine(paperRound))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(paperRound))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(paperRound))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(paperRound))==(?);
  Context_List_Variables(Machine(paperRound))==(?);
  Abstract_List_Variables(Machine(paperRound))==(?);
  Local_List_Variables(Machine(paperRound))==(houseset);
  List_Variables(Machine(paperRound))==(houseset);
  External_List_Variables(Machine(paperRound))==(houseset)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(paperRound))==(?);
  Abstract_List_VisibleVariables(Machine(paperRound))==(?);
  External_List_VisibleVariables(Machine(paperRound))==(?);
  Expanded_List_VisibleVariables(Machine(paperRound))==(?);
  List_VisibleVariables(Machine(paperRound))==(?);
  Internal_List_VisibleVariables(Machine(paperRound))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(paperRound))==(btrue);
  Gluing_List_Invariant(Machine(paperRound))==(btrue);
  Expanded_List_Invariant(Machine(paperRound))==(btrue);
  Abstract_List_Invariant(Machine(paperRound))==(btrue);
  Context_List_Invariant(Machine(paperRound))==(btrue);
  List_Invariant(Machine(paperRound))==(houseset <: NAT1)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(paperRound))==(btrue);
  Abstract_List_Assertions(Machine(paperRound))==(btrue);
  Context_List_Assertions(Machine(paperRound))==(btrue);
  List_Assertions(Machine(paperRound))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(paperRound))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(paperRound))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(paperRound))==(houseset:={});
  Context_List_Initialisation(Machine(paperRound))==(skip);
  List_Initialisation(Machine(paperRound))==(houseset:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(paperRound))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(paperRound))==(btrue);
  List_Constraints(Machine(paperRound))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(paperRound))==(add,number,getsPapers,cancelPapers);
  List_Operations(Machine(paperRound))==(add,number,getsPapers,cancelPapers)
END
&
THEORY ListInputX IS
  List_Input(Machine(paperRound),add)==(new);
  List_Input(Machine(paperRound),number)==(?);
  List_Input(Machine(paperRound),getsPapers)==(houseNumber);
  List_Input(Machine(paperRound),cancelPapers)==(houseNumber)
END
&
THEORY ListOutputX IS
  List_Output(Machine(paperRound),add)==(?);
  List_Output(Machine(paperRound),number)==(ans);
  List_Output(Machine(paperRound),getsPapers)==(numbHouse);
  List_Output(Machine(paperRound),cancelPapers)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(paperRound),add)==(add(new));
  List_Header(Machine(paperRound),number)==(ans <-- number);
  List_Header(Machine(paperRound),getsPapers)==(numbHouse <-- getsPapers(houseNumber));
  List_Header(Machine(paperRound),cancelPapers)==(cancelPapers(houseNumber))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(paperRound),add)==(new: NAT1 & new/:houseset);
  List_Precondition(Machine(paperRound),number)==(btrue);
  List_Precondition(Machine(paperRound),getsPapers)==(houseNumber: NAT1 & houseNumber: houseset);
  List_Precondition(Machine(paperRound),cancelPapers)==(houseNumber: NAT1 & houseNumber: houseset)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(paperRound),cancelPapers)==(houseNumber: NAT1 & houseNumber: houseset | houseset:=houseset-{houseNumber});
  Expanded_List_Substitution(Machine(paperRound),getsPapers)==(houseNumber: NAT1 & houseNumber: houseset | numbHouse:=1);
  Expanded_List_Substitution(Machine(paperRound),number)==(btrue | ans:=card(houseset));
  Expanded_List_Substitution(Machine(paperRound),add)==(new: NAT1 & new/:houseset | houseset:=houseset\/{new});
  List_Substitution(Machine(paperRound),add)==(houseset:=houseset\/{new});
  List_Substitution(Machine(paperRound),number)==(ans:=card(houseset));
  List_Substitution(Machine(paperRound),getsPapers)==(numbHouse:=1);
  List_Substitution(Machine(paperRound),cancelPapers)==(houseset:=houseset-{houseNumber})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(paperRound))==(?);
  Inherited_List_Constants(Machine(paperRound))==(?);
  List_Constants(Machine(paperRound))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(paperRound))==(?);
  Context_List_Defered(Machine(paperRound))==(?);
  Context_List_Sets(Machine(paperRound))==(?);
  List_Valuable_Sets(Machine(paperRound))==(?);
  Inherited_List_Enumerated(Machine(paperRound))==(?);
  Inherited_List_Defered(Machine(paperRound))==(?);
  Inherited_List_Sets(Machine(paperRound))==(?);
  List_Enumerated(Machine(paperRound))==(?);
  List_Defered(Machine(paperRound))==(?);
  List_Sets(Machine(paperRound))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(paperRound))==(?);
  Expanded_List_HiddenConstants(Machine(paperRound))==(?);
  List_HiddenConstants(Machine(paperRound))==(?);
  External_List_HiddenConstants(Machine(paperRound))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(paperRound))==(btrue);
  Context_List_Properties(Machine(paperRound))==(btrue);
  Inherited_List_Properties(Machine(paperRound))==(btrue);
  List_Properties(Machine(paperRound))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(paperRound),add)==(?);
  List_ANY_Var(Machine(paperRound),number)==(?);
  List_ANY_Var(Machine(paperRound),getsPapers)==(?);
  List_ANY_Var(Machine(paperRound),cancelPapers)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(paperRound)) == (? | ? | houseset | ? | add,number,getsPapers,cancelPapers | ? | ? | ? | paperRound);
  List_Of_HiddenCst_Ids(Machine(paperRound)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(paperRound)) == (?);
  List_Of_VisibleVar_Ids(Machine(paperRound)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(paperRound)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(paperRound)) == (Type(houseset) == Mvl(SetOf(btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(paperRound)) == (Type(cancelPapers) == Cst(No_type,btype(INTEGER,?,?));Type(getsPapers) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(number) == Cst(btype(INTEGER,?,?),No_type);Type(add) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(paperRound)) == (Type(getsPapers) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(number) == Cst(btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
