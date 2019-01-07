; ModuleID = 'Coral'
source_filename = "Coral"

%CType.0 = type { %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*)*, %CObj* (%CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj** (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj**)*, i32 (%CObj*)*, i32 (%CObj*)* }
%CObj = type { i8*, %CType.0* }
%CList = type { i8*, i32, i32 }
%CString = type { i8*, i32, i32 }

@ctype_func = global %CType.0 { %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*)* null, %CObj* (%CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj** (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* @func_call, i32 (%CObj*)* null, i32 (%CObj*)* null }
@ctype_int = global %CType.0 { %CObj* (%CObj*, %CObj*)* @int_add, %CObj* (%CObj*, %CObj*)* @int_sub, %CObj* (%CObj*, %CObj*)* @int_mul, %CObj* (%CObj*, %CObj*)* @int_div, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* @int_eq, %CObj* (%CObj*, %CObj*)* @int_neq, %CObj* (%CObj*, %CObj*)* @int_lesser, %CObj* (%CObj*, %CObj*)* @int_leq, %CObj* (%CObj*, %CObj*)* @int_greater, %CObj* (%CObj*, %CObj*)* @int_geq, %CObj* (%CObj*, %CObj*)* @int_and, %CObj* (%CObj*, %CObj*)* @int_or, %CObj* (%CObj*)* @int_neg, %CObj* (%CObj*)* @int_not, %CObj* (%CObj*, %CObj*)* null, %CObj** (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* null, i32 (%CObj*)* @int_heapify, i32 (%CObj*)* @int_print }
@ctype_float = global %CType.0 { %CObj* (%CObj*, %CObj*)* @float_add, %CObj* (%CObj*, %CObj*)* @float_sub, %CObj* (%CObj*, %CObj*)* @float_mul, %CObj* (%CObj*, %CObj*)* @float_div, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* @float_eq, %CObj* (%CObj*, %CObj*)* @float_neq, %CObj* (%CObj*, %CObj*)* @float_lesser, %CObj* (%CObj*, %CObj*)* @float_leq, %CObj* (%CObj*, %CObj*)* @float_greater, %CObj* (%CObj*, %CObj*)* @float_geq, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*)* @float_neg, %CObj* (%CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj** (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* null, i32 (%CObj*)* @float_heapify, i32 (%CObj*)* @float_print }
@ctype_bool = global %CType.0 { %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* @bool_eq, %CObj* (%CObj*, %CObj*)* @bool_neq, %CObj* (%CObj*, %CObj*)* @bool_lesser, %CObj* (%CObj*, %CObj*)* @bool_leq, %CObj* (%CObj*, %CObj*)* @bool_greater, %CObj* (%CObj*, %CObj*)* @bool_geq, %CObj* (%CObj*, %CObj*)* @bool_and, %CObj* (%CObj*, %CObj*)* @bool_or, %CObj* (%CObj*)* @bool_neg, %CObj* (%CObj*)* @bool_not, %CObj* (%CObj*, %CObj*)* null, %CObj** (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* null, i32 (%CObj*)* @bool_heapify, i32 (%CObj*)* @bool_print }
@ctype_char = global %CType.0 { %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* @char_eq, %CObj* (%CObj*, %CObj*)* @char_neq, %CObj* (%CObj*, %CObj*)* @char_lesser, %CObj* (%CObj*, %CObj*)* @char_leq, %CObj* (%CObj*, %CObj*)* @char_greater, %CObj* (%CObj*, %CObj*)* @char_geq, %CObj* (%CObj*, %CObj*)* @char_and, %CObj* (%CObj*, %CObj*)* @char_or, %CObj* (%CObj*)* null, %CObj* (%CObj*)* @char_not, %CObj* (%CObj*, %CObj*)* null, %CObj** (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* null, i32 (%CObj*)* null, i32 (%CObj*)* @char_print }
@ctype_list = global %CType.0 { %CObj* (%CObj*, %CObj*)* @list_add, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*)* null, %CObj* (%CObj*)* null, %CObj* (%CObj*, %CObj*)* @list_idx, %CObj** (%CObj*, %CObj*)* @list_idx_parent, %CObj* (%CObj*, %CObj**)* null, i32 (%CObj*)* @list_heapify, i32 (%CObj*)* @list_print }
@ctype_string = global %CType.0 { %CObj* (%CObj*, %CObj*)* @list_add.1, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*)* null, %CObj* (%CObj*)* null, %CObj* (%CObj*, %CObj*)* @string_idx, %CObj** (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* null, i32 (%CObj*)* @string_heapify, i32 (%CObj*)* @string_print }
@fmt = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.2 = private unnamed_addr constant [3 x i8] c"%g\00"
@fmt.3 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.4 = private unnamed_addr constant [3 x i8] c"%c\00"
@fmt.5 = private unnamed_addr constant [2 x i8] c"[\00"
@fmt.6 = private unnamed_addr constant [3 x i8] c", \00"
@fmt.7 = private unnamed_addr constant [2 x i8] c"]\00"
@bar_dyn_obj = global %CObj zeroinitializer
@bar_dyn = global %CObj* @bar_dyn_obj
@bar_func_obj = global %CObj zeroinitializer
@bar_func = global %CObj* @bar_func_obj
@foo_dyn_obj = global %CObj zeroinitializer
@foo_dyn = global %CObj* @foo_dyn_obj
@foo_func_obj = global %CObj zeroinitializer
@foo_func = global %CObj* @foo_func_obj
@x_int = global i32 0
@x_dyn_obj = global %CObj zeroinitializer
@x_dyn = global %CObj* @x_dyn_obj
@y_dyn_obj = global %CObj zeroinitializer
@y_dyn = global %CObj* @y_dyn_obj
@z_dyn_obj = global %CObj zeroinitializer
@z_dyn = global %CObj* @z_dyn_obj
@fmt.8 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.9 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.10 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.11 = private unnamed_addr constant [2 x i8] c"\0A\00"
@fmt.12 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.13 = private unnamed_addr constant [4 x i8] c"%f\0A\00"
@fmt.14 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message" = private unnamed_addr constant [38 x i8] c"RuntimeError: name 'x' is not defined\00"
@fmt.15 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.16" = private unnamed_addr constant [56 x i8] c"RuntimeError: unsupported operand type(s) for binary ==\00"
@fmt.17 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.18" = private unnamed_addr constant [56 x i8] c"RuntimeError: unsupported operand type(s) for binary ==\00"
@fmt.19 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.20" = private unnamed_addr constant [51 x i8] c"RuntimeError: invalid boolean type in if statement\00"
@fmt.21 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.22 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.23 = private unnamed_addr constant [4 x i8] c"%f\0A\00"
@fmt.24 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.25" = private unnamed_addr constant [38 x i8] c"RuntimeError: name 'x' is not defined\00"
@fmt.26 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.27" = private unnamed_addr constant [55 x i8] c"RuntimeError: unsupported operand type(s) for binary +\00"
@fmt.28 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.29" = private unnamed_addr constant [55 x i8] c"RuntimeError: unsupported operand type(s) for binary +\00"
@fmt.30 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.32" = private unnamed_addr constant [38 x i8] c"RuntimeError: name 'y' is not defined\00"
@fmt.33 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.35" = private unnamed_addr constant [38 x i8] c"RuntimeError: name 'x' is not defined\00"
@fmt.36 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.37" = private unnamed_addr constant [55 x i8] c"RuntimeError: unsupported operand type(s) for binary +\00"
@fmt.38 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.39" = private unnamed_addr constant [55 x i8] c"RuntimeError: unsupported operand type(s) for binary +\00"
@fmt.40 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.41" = private unnamed_addr constant [38 x i8] c"RuntimeError: name 'y' is not defined\00"
@fmt.42 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@"error message.43" = private unnamed_addr constant [38 x i8] c"RuntimeError: name 'z' is not defined\00"
@fmt.44 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

define %CObj* @int_add(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = add i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_sub(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = sub i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_mul(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = mul i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_div(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = sdiv i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_eq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp eq i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_neq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp ne i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_lesser(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp slt i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_leq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp sle i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_greater(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp sgt i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_geq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = icmp sge i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_and(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = and i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_or(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i32*
  %data6 = load i32, i32* %x45
  %result_data = or i32 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_neg(%CObj* %remote_self_p) {
entry:
  %x2 = getelementptr inbounds %CObj, %CObj* %remote_self_p, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x22 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x33 = load i8*, i8** %x22
  %x4 = bitcast i8* %x33 to i32*
  %data = load i32, i32* %x4
  %result_data = sub i32 0, %data
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall4 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @int_not(%CObj* %remote_self_p) {
entry:
  %x2 = getelementptr inbounds %CObj, %CObj* %remote_self_p, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x22 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x33 = load i8*, i8** %x22
  %x4 = bitcast i8* %x33 to i32*
  %data = load i32, i32* %x4
  %result_data = xor i32 %data, -1
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall4 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 %result_data, i32* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_add(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fadd double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to double*
  %dataptr_as_i8 = bitcast double* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_float, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store double %result_data, double* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_sub(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fsub double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to double*
  %dataptr_as_i8 = bitcast double* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_float, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store double %result_data, double* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_mul(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fmul double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to double*
  %dataptr_as_i8 = bitcast double* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_float, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store double %result_data, double* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_div(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fdiv double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to double*
  %dataptr_as_i8 = bitcast double* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_float, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store double %result_data, double* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_eq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp ueq double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_neq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp une double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_lesser(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp ult double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_leq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp ule double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_greater(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp ugt double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_geq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to double*
  %data6 = load double, double* %x45
  %result_data = fcmp uge double %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @float_neg(%CObj* %remote_self_p) {
entry:
  %x2 = getelementptr inbounds %CObj, %CObj* %remote_self_p, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x22 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x33 = load i8*, i8** %x22
  %x4 = bitcast i8* %x33 to double*
  %data = load double, double* %x4
  %result_data = fsub double -0.000000e+00, %data
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall4 to double*
  %dataptr_as_i8 = bitcast double* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_float, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store double %result_data, double* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @bool_eq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp eq i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @bool_neq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp eq i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @bool_lesser(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp slt i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @bool_leq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp sle i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @bool_greater(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp sgt i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @bool_geq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = icmp sge i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @bool_and(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = and i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @bool_or(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %x45 = bitcast i8* %x34 to i1*
  %data6 = load i1, i1* %x45
  %result_data = or i1 %data, %data6
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall7 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @bool_neg(%CObj* %remote_self_p) {
entry:
  %x2 = getelementptr inbounds %CObj, %CObj* %remote_self_p, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x22 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x33 = load i8*, i8** %x22
  %x4 = bitcast i8* %x33 to i1*
  %data = load i1, i1* %x4
  %result_data = sub i1 false, %data
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall4 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @bool_not(%CObj* %remote_self_p) {
entry:
  %x2 = getelementptr inbounds %CObj, %CObj* %remote_self_p, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x22 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x33 = load i8*, i8** %x22
  %x4 = bitcast i8* %x33 to i1*
  %data = load i1, i1* %x4
  %result_data = xor i1 %data, true
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall4 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @char_eq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp eq i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @char_neq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp eq i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @char_lesser(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp slt i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @char_leq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp sle i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @char_greater(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp sgt i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @char_geq(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = icmp sge i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall6 to i1*
  %dataptr_as_i8 = bitcast i1* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_bool, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @char_and(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = add i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %__new_dataptr = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_char, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %__new_dataptr, i8** %datafieldptr
  store i8 %result_data, i8* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @char_or(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
  %x23 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x34 = load i8*, i8** %x23
  %data5 = load i8, i8* %x34
  %result_data = or i8 %data, %data5
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %__new_dataptr = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_char, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %__new_dataptr, i8** %datafieldptr
  store i8 %result_data, i8* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @char_not(%CObj* %remote_self_p) {
entry:
  %x2 = getelementptr inbounds %CObj, %CObj* %remote_self_p, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x22 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x33 = load i8*, i8** %x22
  %data = load i8, i8* %x33
  %result_data = xor i8 %data, -1
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %__new_dataptr = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_char, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %__new_dataptr, i8** %datafieldptr
  store i8 %result_data, i8* %__new_dataptr
  ret %CObj* %__new_objptr
}

define %CObj* @list_idx(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %__gep_addr = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %__objptr = load i8*, i8** %__gep_addr
  %__clistptr = bitcast i8* %__objptr to %CList*
  %x2 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %__gep_addr3 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr = bitcast i8** %__gep_addr3 to %CObj***
  %__gep_addr_as_cobjptrptr = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr
  %__gep_addr_as_cobjptrptr4 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr, i32 %data
  %__cobjptr = load %CObj*, %CObj** %__gep_addr_as_cobjptrptr4
  ret %CObj* %__cobjptr
}

define %CObj** @list_idx_parent(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %__gep_addr = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %__objptr = load i8*, i8** %__gep_addr
  %__clistptr = bitcast i8* %__objptr to %CList*
  %x2 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %__gep_addr3 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr = bitcast i8** %__gep_addr3 to %CObj***
  %__gep_addr_as_cobjptrptr = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr
  %__gep_addr_as_cobjptrptr4 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr, i32 %data
  ret %CObj** %__gep_addr_as_cobjptrptr4
}

define %CObj* @string_idx(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %__gep_addr = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %__objptr = load i8*, i8** %__gep_addr
  %__clistptr = bitcast i8* %__objptr to %CList*
  %x2 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %__gep_addr3 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr = bitcast i8** %__gep_addr3 to %CObj***
  %__gep_addr_as_cobjptrptr = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr
  %__gep_addr_as_cobjptrptr4 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr, i32 %data
  %__cobjptr = load %CObj*, %CObj** %__gep_addr_as_cobjptrptr4
  ret %CObj* %__cobjptr
}

define %CObj* @func_call(%CObj* %remote_self_p, %CObj** %remote_argv) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %argv_p = alloca %CObj**
  store %CObj** %remote_argv, %CObj*** %argv_p
  %argv = load %CObj**, %CObj*** %argv_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %fnptr = bitcast i8* %x3 to %CObj* (%CObj**)*
  %result = call %CObj* %fnptr(%CObj** %argv)
  ret %CObj* %result
}

define %CObj* @list_add(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %__gep_addr = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %__objptr = load i8*, i8** %__gep_addr
  %__clistptr = bitcast i8* %__objptr to %CList*
  %__gep_addr3 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %__objptr4 = load i8*, i8** %__gep_addr3
  %__clistptr5 = bitcast i8* %__objptr4 to %CList*
  %__gep_addr6 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 1
  %__length = load i32, i32* %__gep_addr6
  %__gep_addr7 = getelementptr inbounds %CList, %CList* %__clistptr5, i32 0, i32 1
  %__length8 = load i32, i32* %__gep_addr7
  %total_length = add i32 %__length, %__length8
  %mallocsize = mul i32 %total_length, ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32)
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %__new_dataptr = bitcast i8* %malloccall to %CObj**
  %dataptr_as_i8 = bitcast %CObj** %__new_dataptr to i8*
  %nptr = alloca i32
  store i32 0, i32* %nptr
  br label %iter

iter:                                             ; preds = %list_add_body, %entry
  %n = load i32, i32* %nptr
  %nnext = add i32 %n, 1
  store i32 %nnext, i32* %nptr
  %iter_complete = icmp sge i32 %n, %total_length
  br i1 %iter_complete, label %merge, label %list_add_body

list_add_body:                                    ; preds = %iter
  %__gep_addr9 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr = bitcast i8** %__gep_addr9 to %CObj***
  %__gep_addr_as_cobjptrptr = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr
  %__gep_addr_as_cobjptrptr10 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr, i32 %n
  %__cobjptr = load %CObj*, %CObj** %__gep_addr_as_cobjptrptr10
  %__elem_ptr = getelementptr %CObj*, %CObj** %__new_dataptr, i32 %n
  store %CObj* %__cobjptr, %CObj** %__elem_ptr
  br label %iter

merge:                                            ; preds = %iter
  %__next_dataptr = getelementptr %CObj*, %CObj** %__new_dataptr, i32 %__length
  %nptr11 = alloca i32
  store i32 0, i32* %nptr11
  br label %iter12

iter12:                                           ; preds = %list_add_body16, %merge
  %n13 = load i32, i32* %nptr11
  %nnext14 = add i32 %n13, 1
  store i32 %nnext14, i32* %nptr11
  %iter_complete15 = icmp sge i32 %n13, %total_length
  br i1 %iter_complete15, label %merge23, label %list_add_body16

list_add_body16:                                  ; preds = %iter12
  %__gep_addr17 = getelementptr inbounds %CList, %CList* %__clistptr5, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr18 = bitcast i8** %__gep_addr17 to %CObj***
  %__gep_addr_as_cobjptrptr19 = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr18
  %__gep_addr_as_cobjptrptr20 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr19, i32 %n13
  %__cobjptr21 = load %CObj*, %CObj** %__gep_addr_as_cobjptrptr20
  %__elem_ptr22 = getelementptr %CObj*, %CObj** %__next_dataptr, i32 %n13
  store %CObj* %__cobjptr21, %CObj** %__elem_ptr22
  br label %iter12

merge23:                                          ; preds = %iter12
  %malloccall24 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall24 to %CObj*
  %malloccall25 = tail call i8* @malloc(i32 ptrtoint (%CList* getelementptr (%CList, %CList* null, i32 1) to i32))
  %__new_dataptr26 = bitcast i8* %malloccall25 to %CList*
  %dataptr_as_i827 = bitcast %CList* %__new_dataptr26 to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_list, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i827, i8** %datafieldptr
  %datafieldptr28 = getelementptr inbounds %CList, %CList* %__new_dataptr26, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr28
  %lenfieldptr = getelementptr inbounds %CList, %CList* %__new_dataptr26, i32 0, i32 1
  store i32 %total_length, i32* %lenfieldptr
  %capfieldptr = getelementptr inbounds %CList, %CList* %__new_dataptr26, i32 0, i32 2
  store i32 %total_length, i32* %capfieldptr
  ret %CObj* %__new_objptr
}

define %CObj* @list_add.1(%CObj* %remote_self_p, %CObj* %remote_other_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %other_p_p = alloca %CObj*
  store %CObj* %remote_other_p, %CObj** %other_p_p
  %other_p_p2 = load %CObj*, %CObj** %other_p_p
  %__gep_addr = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %__objptr = load i8*, i8** %__gep_addr
  %__clistptr = bitcast i8* %__objptr to %CList*
  %__gep_addr3 = getelementptr inbounds %CObj, %CObj* %other_p_p2, i32 0, i32 0
  %__objptr4 = load i8*, i8** %__gep_addr3
  %__clistptr5 = bitcast i8* %__objptr4 to %CList*
  %__gep_addr6 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 1
  %__length = load i32, i32* %__gep_addr6
  %__gep_addr7 = getelementptr inbounds %CList, %CList* %__clistptr5, i32 0, i32 1
  %__length8 = load i32, i32* %__gep_addr7
  %total_length = add i32 %__length, %__length8
  %mallocsize = mul i32 %total_length, ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32)
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %__new_dataptr = bitcast i8* %malloccall to %CObj**
  %dataptr_as_i8 = bitcast %CObj** %__new_dataptr to i8*
  %nptr = alloca i32
  store i32 0, i32* %nptr
  br label %iter

iter:                                             ; preds = %list_add_body, %entry
  %n = load i32, i32* %nptr
  %nnext = add i32 %n, 1
  store i32 %nnext, i32* %nptr
  %iter_complete = icmp sge i32 %n, %total_length
  br i1 %iter_complete, label %merge, label %list_add_body

list_add_body:                                    ; preds = %iter
  %__gep_addr9 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr = bitcast i8** %__gep_addr9 to %CObj***
  %__gep_addr_as_cobjptrptr = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr
  %__gep_addr_as_cobjptrptr10 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr, i32 %n
  %__cobjptr = load %CObj*, %CObj** %__gep_addr_as_cobjptrptr10
  %__elem_ptr = getelementptr %CObj*, %CObj** %__new_dataptr, i32 %n
  store %CObj* %__cobjptr, %CObj** %__elem_ptr
  br label %iter

merge:                                            ; preds = %iter
  %__next_dataptr = getelementptr %CObj*, %CObj** %__new_dataptr, i32 %__length
  %nptr11 = alloca i32
  store i32 0, i32* %nptr11
  br label %iter12

iter12:                                           ; preds = %list_add_body16, %merge
  %n13 = load i32, i32* %nptr11
  %nnext14 = add i32 %n13, 1
  store i32 %nnext14, i32* %nptr11
  %iter_complete15 = icmp sge i32 %n13, %total_length
  br i1 %iter_complete15, label %merge23, label %list_add_body16

list_add_body16:                                  ; preds = %iter12
  %__gep_addr17 = getelementptr inbounds %CList, %CList* %__clistptr5, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr18 = bitcast i8** %__gep_addr17 to %CObj***
  %__gep_addr_as_cobjptrptr19 = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr18
  %__gep_addr_as_cobjptrptr20 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr19, i32 %n13
  %__cobjptr21 = load %CObj*, %CObj** %__gep_addr_as_cobjptrptr20
  %__elem_ptr22 = getelementptr %CObj*, %CObj** %__next_dataptr, i32 %n13
  store %CObj* %__cobjptr21, %CObj** %__elem_ptr22
  br label %iter12

merge23:                                          ; preds = %iter12
  %malloccall24 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall24 to %CObj*
  %malloccall25 = tail call i8* @malloc(i32 ptrtoint (%CString* getelementptr (%CString, %CString* null, i32 1) to i32))
  %__new_dataptr26 = bitcast i8* %malloccall25 to %CString*
  %dataptr_as_i827 = bitcast %CString* %__new_dataptr26 to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_string, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i827, i8** %datafieldptr
  %datafieldptr28 = getelementptr inbounds %CString, %CString* %__new_dataptr26, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr28
  %lenfieldptr = getelementptr inbounds %CString, %CString* %__new_dataptr26, i32 0, i32 1
  store i32 %total_length, i32* %lenfieldptr
  %capfieldptr = getelementptr inbounds %CString, %CString* %__new_dataptr26, i32 0, i32 2
  store i32 %total_length, i32* %capfieldptr
  ret %CObj* %__new_objptr
}

define i32 @int_print(%CObj* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %dat = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %dat2 = bitcast i8** %dat to i32**
  %raw_data_addr = load i32*, i32** %dat2
  %raw_data = load i32, i32* %raw_data_addr
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt, i32 0, i32 0), i32 %raw_data)
  ret i32 0
}

define i32 @char_print(%CObj* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %dat = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %raw_data_addr = load i8*, i8** %dat
  %raw_data = load i8, i8* %raw_data_addr
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.4, i32 0, i32 0), i8 %raw_data)
  ret i32 0
}

define i32 @float_print(%CObj* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %dat = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %dat2 = bitcast i8** %dat to double**
  %raw_data_addr = load double*, double** %dat2
  %raw_data = load double, double* %raw_data_addr
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.2, i32 0, i32 0), double %raw_data)
  ret i32 0
}

define i32 @bool_print(%CObj* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %dat = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %dat2 = bitcast i8** %dat to i1**
  %raw_data_addr = load i1*, i1** %dat2
  %raw_data = load i1, i1* %raw_data_addr
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.3, i32 0, i32 0), i1 %raw_data)
  ret i32 0
}

define i32 @list_print(%CObj* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %__gep_addr = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %__objptr = load i8*, i8** %__gep_addr
  %__clistptr = bitcast i8* %__objptr to %CList*
  %nptr = alloca i32
  store i32 0, i32* %nptr
  %n = load i32, i32* %nptr
  %__gep_addr2 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 1
  %__length = load i32, i32* %__gep_addr2
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @fmt.5, i32 0, i32 0), i32 0)
  br label %iter

iter:                                             ; preds = %list_print_body, %entry
  %n3 = load i32, i32* %nptr
  %nnext = add i32 %n3, 1
  store i32 %nnext, i32* %nptr
  %iter_complete = icmp sge i32 %n3, %__length
  br i1 %iter_complete, label %merge, label %list_print_body

list_print_body:                                  ; preds = %iter
  %__gep_addr4 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr = bitcast i8** %__gep_addr4 to %CObj***
  %__gep_addr_as_cobjptrptr = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr
  %__gep_addr_as_cobjptrptr5 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr, i32 %n3
  %__cobjptr = load %CObj*, %CObj** %__gep_addr_as_cobjptrptr5
  %x2 = getelementptr inbounds %CObj, %CObj* %__cobjptr, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %x4 = getelementptr inbounds %CType.0, %CType.0* %x3, i32 0, i32 19
  %fn_ptr = load i32 (%CObj*)*, i32 (%CObj*)** %x4
  %print_cob = call i32 %fn_ptr(%CObj* %__cobjptr)
  %printf6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.6, i32 0, i32 0), i32 0)
  br label %iter

merge:                                            ; preds = %iter
  %printf7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @fmt.7, i32 0, i32 0), i32 0)
  ret i32 0
}

define i32 @string_print(%CObj* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %__gep_addr = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %__objptr = load i8*, i8** %__gep_addr
  %__clistptr = bitcast i8* %__objptr to %CList*
  %nptr = alloca i32
  store i32 0, i32* %nptr
  %n = load i32, i32* %nptr
  %__gep_addr2 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 1
  %__length = load i32, i32* %__gep_addr2
  br label %iter

iter:                                             ; preds = %list_print_body, %entry
  %n3 = load i32, i32* %nptr
  %nnext = add i32 %n3, 1
  store i32 %nnext, i32* %nptr
  %iter_complete = icmp sge i32 %n3, %__length
  br i1 %iter_complete, label %merge, label %list_print_body

list_print_body:                                  ; preds = %iter
  %__gep_addr4 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr = bitcast i8** %__gep_addr4 to %CObj***
  %__gep_addr_as_cobjptrptr = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr
  %__gep_addr_as_cobjptrptr5 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr, i32 %n3
  %__cobjptr = load %CObj*, %CObj** %__gep_addr_as_cobjptrptr5
  %x2 = getelementptr inbounds %CObj, %CObj* %__cobjptr, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %x4 = getelementptr inbounds %CType.0, %CType.0* %x3, i32 0, i32 19
  %fn_ptr = load i32 (%CObj*)*, i32 (%CObj*)** %x4
  %print_cob = call i32 %fn_ptr(%CObj* %__cobjptr)
  br label %iter

merge:                                            ; preds = %iter
  ret i32 0
}

define i32 @int_heapify(%CObj* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %dat = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %dat2 = bitcast i8** %dat to i32**
  %raw_data_addr = load i32*, i32** %dat2
  %raw_data = load i32, i32* %raw_data_addr
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %heap_data_p = bitcast i8* %malloccall to i32*
  store i32 %raw_data, i32* %heap_data_p
  %heap_data_p3 = bitcast i32* %heap_data_p to i8*
  store i8* %heap_data_p3, i8** %dat
  ret i32 0
}

define i32 @float_heapify(%CObj* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %dat = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %dat2 = bitcast i8** %dat to double**
  %raw_data_addr = load double*, double** %dat2
  %raw_data = load double, double* %raw_data_addr
  %malloccall = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %heap_data_p = bitcast i8* %malloccall to double*
  store double %raw_data, double* %heap_data_p
  %heap_data_p3 = bitcast double* %heap_data_p to i8*
  store i8* %heap_data_p3, i8** %dat
  ret i32 0
}

define i32 @bool_heapify(%CObj* %remote_self_p) {
entry:
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %dat = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %dat2 = bitcast i8** %dat to i1**
  %raw_data_addr = load i1*, i1** %dat2
  %raw_data = load i1, i1* %raw_data_addr
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %heap_data_p = bitcast i8* %malloccall to i1*
  store i1 %raw_data, i1* %heap_data_p
  %heap_data_p3 = bitcast i1* %heap_data_p to i8*
  store i8* %heap_data_p3, i8** %dat
  ret i32 0
}

define i32 @func_heapify(%CObj*) {
entry:
  ret i32 0
}

define i32 @list_heapify(%CObj*) {
entry:
  ret i32 0
}

define i32 @string_heapify(%CObj*) {
entry:
  ret i32 0
}

declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

declare i32 @exit(i32)

define i32 @main() {
entry:
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  %dfp_as_fp = bitcast i8** %datafieldptr to %CObj* (%CObj**)**
  store %CObj* (%CObj**)* @foo, %CObj* (%CObj**)** %dfp_as_fp
  store %CType.0* @ctype_func, %CType.0** %ctypefieldptr
  store %CObj* %__new_objptr, %CObj** @foo_func
  %malloccall1 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr2 = bitcast i8* %malloccall1 to %CObj*
  %datafieldptr3 = getelementptr inbounds %CObj, %CObj* %__new_objptr2, i32 0, i32 0
  %ctypefieldptr4 = getelementptr inbounds %CObj, %CObj* %__new_objptr2, i32 0, i32 1
  %dfp_as_fp5 = bitcast i8** %datafieldptr3 to %CObj* (%CObj**)**
  store %CObj* (%CObj**)* @bar, %CObj* (%CObj**)** %dfp_as_fp5
  store %CType.0* @ctype_func, %CType.0** %ctypefieldptr4
  store %CObj* %__new_objptr2, %CObj** @bar_func
  store i32 3, i32* @x_int
  %result = call %CObj* @foo.31()
  store %CObj* %result, %CObj** @y_dyn
  %load_ptr = load %CObj*, %CObj** @y_dyn
  %dat_p_p = getelementptr inbounds %CObj, %CObj* %load_ptr, i32 0, i32 0
  %load_ptr2 = load i8*, i8** %dat_p_p
  %invalid_defined = icmp eq i8* %load_ptr2, null
  br i1 %invalid_defined, label %bad_defined, label %proceed

bad_defined:                                      ; preds = %entry
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.33, i32 0, i32 0), [38 x i8]* @"error message.32")
  %exit = call i32 @exit(i32 1)
  br label %proceed

proceed:                                          ; preds = %bad_defined, %entry
  %y = load %CObj*, %CObj** @y_dyn
  %result6 = call %CObj* @bar.34(%CObj* %y)
  %x2 = getelementptr inbounds %CObj, %CObj* %result6, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %x4 = getelementptr inbounds %CType.0, %CType.0* %x3, i32 0, i32 19
  %fn_ptr = load i32 (%CObj*)*, i32 (%CObj*)** %x4
  %print_cob = call i32 %fn_ptr(%CObj* %result6)
  %printf7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @fmt.11, i32 0, i32 0), i32 0)
  %load_ptr10 = load %CObj*, %CObj** @y_dyn
  %dat_p_p11 = getelementptr inbounds %CObj, %CObj* %load_ptr10, i32 0, i32 0
  %load_ptr212 = load i8*, i8** %dat_p_p11
  %invalid_defined13 = icmp eq i8* %load_ptr212, null
  br i1 %invalid_defined13, label %bad_defined8, label %proceed9

bad_defined8:                                     ; preds = %proceed
  %printf14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.42, i32 0, i32 0), [38 x i8]* @"error message.41")
  %exit15 = call i32 @exit(i32 1)
  br label %proceed9

proceed9:                                         ; preds = %bad_defined8, %proceed
  %y16 = load %CObj*, %CObj** @y_dyn
  %result17 = call %CObj* @bar.34(%CObj* %y16)
  store %CObj* %result17, %CObj** @z_dyn
  %load_ptr20 = load %CObj*, %CObj** @z_dyn
  %dat_p_p21 = getelementptr inbounds %CObj, %CObj* %load_ptr20, i32 0, i32 0
  %load_ptr222 = load i8*, i8** %dat_p_p21
  %invalid_defined23 = icmp eq i8* %load_ptr222, null
  br i1 %invalid_defined23, label %bad_defined18, label %proceed19

bad_defined18:                                    ; preds = %proceed9
  %printf24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.44, i32 0, i32 0), [38 x i8]* @"error message.43")
  %exit25 = call i32 @exit(i32 1)
  br label %proceed19

proceed19:                                        ; preds = %bad_defined18, %proceed9
  %z = load %CObj*, %CObj** @z_dyn
  %x226 = getelementptr inbounds %CObj, %CObj* %z, i32 0, i32 1
  %x327 = load %CType.0*, %CType.0** %x226
  %x428 = getelementptr inbounds %CType.0, %CType.0* %x327, i32 0, i32 19
  %fn_ptr29 = load i32 (%CObj*)*, i32 (%CObj*)** %x428
  %print_cob30 = call i32 %fn_ptr29(%CObj* %z)
  %printf31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @fmt.11, i32 0, i32 0), i32 0)
  %result32 = call double @bar.45(double 3.000000e+00)
  %printf33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.10, i32 0, i32 0), double %result32)
  ret i32 0
}

define %CObj* @foo(%CObj**) {
entry:
  %formals_arr_p = bitcast %CObj** %0 to [0 x %CObj*]*
  %formals_arr = load [0 x %CObj*], [0 x %CObj*]* %formals_arr_p
  %load_ptr = load %CObj*, %CObj** @x_dyn
  %dat_p_p = getelementptr inbounds %CObj, %CObj* %load_ptr, i32 0, i32 0
  %load_ptr2 = load i8*, i8** %dat_p_p
  %invalid_defined = icmp eq i8* %load_ptr2, null
  br i1 %invalid_defined, label %bad_defined, label %proceed

bad_defined:                                      ; preds = %entry
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.15, i32 0, i32 0), [38 x i8]* @"error message")
  %exit = call i32 @exit(i32 1)
  br label %proceed

proceed:                                          ; preds = %bad_defined, %entry
  %x = load %CObj*, %CObj** @x_dyn
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %box = bitcast i8* %malloccall to %CObj*
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %heap_data_temp_box = bitcast i8* %malloccall1 to i32*
  store i32 3, i32* %heap_data_temp_box
  %heap_data_p = bitcast i32* %heap_data_temp_box to i8*
  %dat = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 0
  %ty = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 1
  store i8* %heap_data_p, i8** %dat
  store %CType.0* @ctype_int, %CType.0** %ty
  %x2 = getelementptr inbounds %CObj, %CObj* %x, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %x4 = getelementptr inbounds %CType.0, %CType.0* %x3, i32 0, i32 5
  %fn_ptr = load %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)** %x4
  %invalid_null = icmp eq %CObj* (%CObj*, %CObj*)* %fn_ptr, null
  br i1 %invalid_null, label %bad_null, label %proceed2

bad_null:                                         ; preds = %proceed
  %printf3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.17, i32 0, i32 0), [56 x i8]* @"error message.16")
  %exit4 = call i32 @exit(i32 1)
  br label %proceed2

proceed2:                                         ; preds = %bad_null, %proceed
  %x26 = getelementptr inbounds %CObj, %CObj* %x, i32 0, i32 1
  %x37 = load %CType.0*, %CType.0** %x26
  %x28 = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 1
  %x39 = load %CType.0*, %CType.0** %x28
  %typ1_as_int = ptrtoint %CType.0* %x37 to i32
  %typ2_as_int = ptrtoint %CType.0* %x39 to i32
  %diff = sub i32 %typ1_as_int, %typ2_as_int
  %invalid_type = icmp ne i32 %diff, 0
  br i1 %invalid_type, label %bad_type, label %proceed5

bad_type:                                         ; preds = %proceed2
  %printf10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.19, i32 0, i32 0), [56 x i8]* @"error message.18")
  %exit11 = call i32 @exit(i32 1)
  br label %proceed5

proceed5:                                         ; preds = %bad_type, %proceed2
  %binop_result = call %CObj* %fn_ptr(%CObj* %x, %CObj* %box)
  %x214 = getelementptr inbounds %CObj, %CObj* %binop_result, i32 0, i32 1
  %x315 = load %CType.0*, %CType.0** %x214
  %typ2_as_int16 = ptrtoint %CType.0* %x315 to i32
  %diff17 = sub i32 ptrtoint (%CType.0* @ctype_bool to i32), %typ2_as_int16
  %invalid_type18 = icmp ne i32 %diff17, 0
  br i1 %invalid_type18, label %bad_type12, label %proceed13

bad_type12:                                       ; preds = %proceed5
  %printf19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.21, i32 0, i32 0), [51 x i8]* @"error message.20")
  %exit20 = call i32 @exit(i32 1)
  br label %proceed13

proceed13:                                        ; preds = %bad_type12, %proceed5
  %x221 = getelementptr inbounds %CObj, %CObj* %binop_result, i32 0, i32 0
  %x322 = load i8*, i8** %x221
  %x423 = bitcast i8* %x322 to i1*
  %data = load i1, i1* %x423
  br i1 %data, label %then, label %else

merge:                                            ; No predecessors!
  %malloccall38 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall38 to %CObj*
  %malloccall39 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall39 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 0, i32* %__new_dataptr
  ret %CObj* %__new_objptr

then:                                             ; preds = %proceed13
  %malloccall24 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %box25 = bitcast i8* %malloccall24 to %CObj*
  %malloccall26 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %heap_data_temp_box27 = bitcast i8* %malloccall26 to double*
  store double 3.000000e+00, double* %heap_data_temp_box27
  %heap_data_p28 = bitcast double* %heap_data_temp_box27 to i8*
  %dat29 = getelementptr inbounds %CObj, %CObj* %box25, i32 0, i32 0
  %ty30 = getelementptr inbounds %CObj, %CObj* %box25, i32 0, i32 1
  store i8* %heap_data_p28, i8** %dat29
  store %CType.0* @ctype_float, %CType.0** %ty30
  ret %CObj* %box25

else:                                             ; preds = %proceed13
  %malloccall31 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %box32 = bitcast i8* %malloccall31 to %CObj*
  %malloccall33 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %heap_data_temp_box34 = bitcast i8* %malloccall33 to i32*
  store i32 4, i32* %heap_data_temp_box34
  %heap_data_p35 = bitcast i32* %heap_data_temp_box34 to i8*
  %dat36 = getelementptr inbounds %CObj, %CObj* %box32, i32 0, i32 0
  %ty37 = getelementptr inbounds %CObj, %CObj* %box32, i32 0, i32 1
  store i8* %heap_data_p35, i8** %dat36
  store %CType.0* @ctype_int, %CType.0** %ty37
  ret %CObj* %box32
}

define %CObj* @bar(%CObj**) {
entry:
  %formals_arr_p = bitcast %CObj** %0 to [1 x %CObj*]*
  %formals_arr = load [1 x %CObj*], [1 x %CObj*]* %formals_arr_p
  %x = extractvalue [1 x %CObj*] %formals_arr, 0
  %x1 = alloca %CObj*
  store %CObj* %x, %CObj** %x1
  %load_ptr = load %CObj*, %CObj** %x1
  %dat_p_p = getelementptr inbounds %CObj, %CObj* %load_ptr, i32 0, i32 0
  %load_ptr2 = load i8*, i8** %dat_p_p
  %invalid_defined = icmp eq i8* %load_ptr2, null
  br i1 %invalid_defined, label %bad_defined, label %proceed

bad_defined:                                      ; preds = %entry
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.26, i32 0, i32 0), [38 x i8]* @"error message.25")
  %exit = call i32 @exit(i32 1)
  br label %proceed

proceed:                                          ; preds = %bad_defined, %entry
  %x2 = load %CObj*, %CObj** %x1
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %box = bitcast i8* %malloccall to %CObj*
  %malloccall3 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %heap_data_temp_box = bitcast i8* %malloccall3 to double*
  store double 4.000000e+00, double* %heap_data_temp_box
  %heap_data_p = bitcast double* %heap_data_temp_box to i8*
  %dat = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 0
  %ty = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 1
  store i8* %heap_data_p, i8** %dat
  store %CType.0* @ctype_float, %CType.0** %ty
  %x24 = getelementptr inbounds %CObj, %CObj* %x2, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x24
  %x4 = getelementptr inbounds %CType.0, %CType.0* %x3, i32 0, i32 0
  %fn_ptr = load %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)** %x4
  %invalid_null = icmp eq %CObj* (%CObj*, %CObj*)* %fn_ptr, null
  br i1 %invalid_null, label %bad_null, label %proceed5

bad_null:                                         ; preds = %proceed
  %printf6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.28, i32 0, i32 0), [55 x i8]* @"error message.27")
  %exit7 = call i32 @exit(i32 1)
  br label %proceed5

proceed5:                                         ; preds = %bad_null, %proceed
  %x29 = getelementptr inbounds %CObj, %CObj* %x2, i32 0, i32 1
  %x310 = load %CType.0*, %CType.0** %x29
  %x211 = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 1
  %x312 = load %CType.0*, %CType.0** %x211
  %typ1_as_int = ptrtoint %CType.0* %x310 to i32
  %typ2_as_int = ptrtoint %CType.0* %x312 to i32
  %diff = sub i32 %typ1_as_int, %typ2_as_int
  %invalid_type = icmp ne i32 %diff, 0
  br i1 %invalid_type, label %bad_type, label %proceed8

bad_type:                                         ; preds = %proceed5
  %printf13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.30, i32 0, i32 0), [55 x i8]* @"error message.29")
  %exit14 = call i32 @exit(i32 1)
  br label %proceed8

proceed8:                                         ; preds = %bad_type, %proceed5
  %binop_result = call %CObj* %fn_ptr(%CObj* %x2, %CObj* %box)
  ret %CObj* %binop_result
}

define %CObj* @foo.31() {
entry:
  %x = load i32, i32* @x_int
  %binop_result = icmp eq i32 %x, 3
  br i1 %binop_result, label %then, label %else

merge:                                            ; No predecessors!
  %malloccall9 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall9 to %CObj*
  %malloccall10 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall10 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 0, i32* %__new_dataptr
  ret %CObj* %__new_objptr

then:                                             ; preds = %entry
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %box = bitcast i8* %malloccall to %CObj*
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %heap_data_temp_box = bitcast i8* %malloccall1 to double*
  store double 3.000000e+00, double* %heap_data_temp_box
  %heap_data_p = bitcast double* %heap_data_temp_box to i8*
  %dat = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 0
  %ty = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 1
  store i8* %heap_data_p, i8** %dat
  store %CType.0* @ctype_float, %CType.0** %ty
  ret %CObj* %box

else:                                             ; preds = %entry
  %malloccall2 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %box3 = bitcast i8* %malloccall2 to %CObj*
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %heap_data_temp_box5 = bitcast i8* %malloccall4 to i32*
  store i32 4, i32* %heap_data_temp_box5
  %heap_data_p6 = bitcast i32* %heap_data_temp_box5 to i8*
  %dat7 = getelementptr inbounds %CObj, %CObj* %box3, i32 0, i32 0
  %ty8 = getelementptr inbounds %CObj, %CObj* %box3, i32 0, i32 1
  store i8* %heap_data_p6, i8** %dat7
  store %CType.0* @ctype_int, %CType.0** %ty8
  ret %CObj* %box3
}

define %CObj* @bar.34(%CObj*) {
entry:
  %x_dyn = alloca %CObj*
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  store %CObj* %__new_objptr, %CObj** %x_dyn
  store %CObj zeroinitializer, %CObj* %__new_objptr
  store %CObj* %0, %CObj** %x_dyn
  %load_ptr = load %CObj*, %CObj** %x_dyn
  %dat_p_p = getelementptr inbounds %CObj, %CObj* %load_ptr, i32 0, i32 0
  %load_ptr2 = load i8*, i8** %dat_p_p
  %invalid_defined = icmp eq i8* %load_ptr2, null
  br i1 %invalid_defined, label %bad_defined, label %proceed

bad_defined:                                      ; preds = %entry
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.36, i32 0, i32 0), [38 x i8]* @"error message.35")
  %exit = call i32 @exit(i32 1)
  br label %proceed

proceed:                                          ; preds = %bad_defined, %entry
  %x = load %CObj*, %CObj** %x_dyn
  %malloccall1 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %box = bitcast i8* %malloccall1 to %CObj*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %heap_data_temp_box = bitcast i8* %malloccall2 to double*
  store double 4.000000e+00, double* %heap_data_temp_box
  %heap_data_p = bitcast double* %heap_data_temp_box to i8*
  %dat = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 0
  %ty = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 1
  store i8* %heap_data_p, i8** %dat
  store %CType.0* @ctype_float, %CType.0** %ty
  %x2 = getelementptr inbounds %CObj, %CObj* %x, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %x4 = getelementptr inbounds %CType.0, %CType.0* %x3, i32 0, i32 0
  %fn_ptr = load %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)** %x4
  %invalid_null = icmp eq %CObj* (%CObj*, %CObj*)* %fn_ptr, null
  br i1 %invalid_null, label %bad_null, label %proceed3

bad_null:                                         ; preds = %proceed
  %printf4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.38, i32 0, i32 0), [55 x i8]* @"error message.37")
  %exit5 = call i32 @exit(i32 1)
  br label %proceed3

proceed3:                                         ; preds = %bad_null, %proceed
  %x27 = getelementptr inbounds %CObj, %CObj* %x, i32 0, i32 1
  %x38 = load %CType.0*, %CType.0** %x27
  %x29 = getelementptr inbounds %CObj, %CObj* %box, i32 0, i32 1
  %x310 = load %CType.0*, %CType.0** %x29
  %typ1_as_int = ptrtoint %CType.0* %x38 to i32
  %typ2_as_int = ptrtoint %CType.0* %x310 to i32
  %diff = sub i32 %typ1_as_int, %typ2_as_int
  %invalid_type = icmp ne i32 %diff, 0
  br i1 %invalid_type, label %bad_type, label %proceed6

bad_type:                                         ; preds = %proceed3
  %printf11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.40, i32 0, i32 0), [55 x i8]* @"error message.39")
  %exit12 = call i32 @exit(i32 1)
  br label %proceed6

proceed6:                                         ; preds = %bad_type, %proceed3
  %binop_result = call %CObj* %fn_ptr(%CObj* %x, %CObj* %box)
  ret %CObj* %binop_result
}

define double @bar.45(double) {
entry:
  %x_float = alloca double
  store double %0, double* %x_float
  %x = load double, double* %x_float
  %binop_result = fadd double %x, 4.000000e+00
  ret double %binop_result
}

