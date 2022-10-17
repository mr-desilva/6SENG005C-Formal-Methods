Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Sets))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Sets))==(Machine(Sets));
  Level(Machine(Sets))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Sets)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Sets))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Sets))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Sets))==(?);
  List_Includes(Machine(Sets))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Sets))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Sets))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Sets))==(?);
  Context_List_Variables(Machine(Sets))==(?);
  Abstract_List_Variables(Machine(Sets))==(?);
  Local_List_Variables(Machine(Sets))==(pointing,keys,dirs);
  List_Variables(Machine(Sets))==(pointing,keys,dirs);
  External_List_Variables(Machine(Sets))==(pointing,keys,dirs)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Sets))==(?);
  Abstract_List_VisibleVariables(Machine(Sets))==(?);
  External_List_VisibleVariables(Machine(Sets))==(?);
  Expanded_List_VisibleVariables(Machine(Sets))==(?);
  List_VisibleVariables(Machine(Sets))==(?);
  Internal_List_VisibleVariables(Machine(Sets))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Sets))==(btrue);
  Gluing_List_Invariant(Machine(Sets))==(btrue);
  Expanded_List_Invariant(Machine(Sets))==(btrue);
  Abstract_List_Invariant(Machine(Sets))==(btrue);
  Context_List_Invariant(Machine(Sets))==(btrue);
  List_Invariant(Machine(Sets))==(dirs <: DIRECTION & keys <: CURSOR_KEY & pointing: dirs)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Sets))==(btrue);
  Abstract_List_Assertions(Machine(Sets))==(btrue);
  Context_List_Assertions(Machine(Sets))==(btrue);
  List_Assertions(Machine(Sets))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Sets))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Sets))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Sets))==(dirs,keys,pointing:={North,South},{Up_Key,Down_Key},North);
  Context_List_Initialisation(Machine(Sets))==(skip);
  List_Initialisation(Machine(Sets))==(dirs,keys,pointing:={North,South},{Up_Key,Down_Key},North)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Sets))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Sets))==(btrue);
  List_Constraints(Machine(Sets))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Sets))==(?);
  List_Operations(Machine(Sets))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Sets))==(Jim,Sue);
  Inherited_List_Constants(Machine(Sets))==(?);
  List_Constants(Machine(Sets))==(Jim,Sue)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Sets),PEOPLE)==(?);
  Context_List_Enumerated(Machine(Sets))==(?);
  Context_List_Defered(Machine(Sets))==(?);
  Context_List_Sets(Machine(Sets))==(?);
  List_Valuable_Sets(Machine(Sets))==(PEOPLE);
  Inherited_List_Enumerated(Machine(Sets))==(?);
  Inherited_List_Defered(Machine(Sets))==(?);
  Inherited_List_Sets(Machine(Sets))==(?);
  List_Enumerated(Machine(Sets))==(ANSWER,CURSOR_KEY,DIRECTION);
  List_Defered(Machine(Sets))==(PEOPLE);
  List_Sets(Machine(Sets))==(PEOPLE,ANSWER,CURSOR_KEY,DIRECTION);
  Set_Definition(Machine(Sets),ANSWER)==({yes,no});
  Set_Definition(Machine(Sets),CURSOR_KEY)==({Up_Key,Down_Key,Left_Key,Right_Key});
  Set_Definition(Machine(Sets),DIRECTION)==({North,South,East,West})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Sets))==(?);
  Expanded_List_HiddenConstants(Machine(Sets))==(?);
  List_HiddenConstants(Machine(Sets))==(?);
  External_List_HiddenConstants(Machine(Sets))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Sets))==(btrue);
  Context_List_Properties(Machine(Sets))==(btrue);
  Inherited_List_Properties(Machine(Sets))==(btrue);
  List_Properties(Machine(Sets))==(Jim: PEOPLE & Sue: PEOPLE & Jim/=Sue & PEOPLE: FIN(INTEGER) & not(PEOPLE = {}) & ANSWER: FIN(INTEGER) & not(ANSWER = {}) & CURSOR_KEY: FIN(INTEGER) & not(CURSOR_KEY = {}) & DIRECTION: FIN(INTEGER) & not(DIRECTION = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Sets)) == (Jim,Sue,PEOPLE,ANSWER,CURSOR_KEY,DIRECTION,yes,no,Up_Key,Down_Key,Left_Key,Right_Key,North,South,East,West | ? | pointing,keys,dirs | ? | ? | ? | ? | ? | Sets);
  List_Of_HiddenCst_Ids(Machine(Sets)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Sets)) == (Jim,Sue);
  List_Of_VisibleVar_Ids(Machine(Sets)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Sets)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Sets)) == (Type(PEOPLE) == Cst(SetOf(atype(PEOPLE,"[PEOPLE","]PEOPLE")));Type(ANSWER) == Cst(SetOf(etype(ANSWER,0,1)));Type(CURSOR_KEY) == Cst(SetOf(etype(CURSOR_KEY,0,3)));Type(DIRECTION) == Cst(SetOf(etype(DIRECTION,0,3))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Sets)) == (Type(yes) == Cst(etype(ANSWER,0,1));Type(no) == Cst(etype(ANSWER,0,1));Type(Up_Key) == Cst(etype(CURSOR_KEY,0,3));Type(Down_Key) == Cst(etype(CURSOR_KEY,0,3));Type(Left_Key) == Cst(etype(CURSOR_KEY,0,3));Type(Right_Key) == Cst(etype(CURSOR_KEY,0,3));Type(North) == Cst(etype(DIRECTION,0,3));Type(South) == Cst(etype(DIRECTION,0,3));Type(East) == Cst(etype(DIRECTION,0,3));Type(West) == Cst(etype(DIRECTION,0,3));Type(Jim) == Cst(atype(PEOPLE,?,?));Type(Sue) == Cst(atype(PEOPLE,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Sets)) == (Type(pointing) == Mvl(etype(DIRECTION,?,?));Type(keys) == Mvl(SetOf(etype(CURSOR_KEY,?,?)));Type(dirs) == Mvl(SetOf(etype(DIRECTION,?,?))))
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
