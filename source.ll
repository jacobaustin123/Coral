; ModuleID = 'Coral'
source_filename = "Coral"

%CType.0 = type { %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*)*, %CObj* (%CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj**)* }
%CObj = type { i8*, %CType.0* }
%CList = type { i8*, i32, i32 }

@ctype_func = global %CType.0 { %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*)* null, %CObj* (%CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* @func_call }
@ctype_int = global %CType.0 { %CObj* (%CObj*, %CObj*)* @int_add, %CObj* (%CObj*, %CObj*)* @int_sub, %CObj* (%CObj*, %CObj*)* @int_mul, %CObj* (%CObj*, %CObj*)* @int_div, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* @int_eq, %CObj* (%CObj*, %CObj*)* @int_neq, %CObj* (%CObj*, %CObj*)* @int_lesser, %CObj* (%CObj*, %CObj*)* @int_leq, %CObj* (%CObj*, %CObj*)* @int_greater, %CObj* (%CObj*, %CObj*)* @int_geq, %CObj* (%CObj*, %CObj*)* @int_and, %CObj* (%CObj*, %CObj*)* @int_or, %CObj* (%CObj*)* @int_neg, %CObj* (%CObj*)* @int_not, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* null }
@ctype_float = global %CType.0 { %CObj* (%CObj*, %CObj*)* @float_add, %CObj* (%CObj*, %CObj*)* @float_sub, %CObj* (%CObj*, %CObj*)* @float_mul, %CObj* (%CObj*, %CObj*)* @float_div, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* @float_eq, %CObj* (%CObj*, %CObj*)* @float_neq, %CObj* (%CObj*, %CObj*)* @float_lesser, %CObj* (%CObj*, %CObj*)* @float_leq, %CObj* (%CObj*, %CObj*)* @float_greater, %CObj* (%CObj*, %CObj*)* @float_geq, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*)* @float_neg, %CObj* (%CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* null }
@ctype_bool = global %CType.0 { %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* @bool_eq, %CObj* (%CObj*, %CObj*)* @bool_neq, %CObj* (%CObj*, %CObj*)* @bool_lesser, %CObj* (%CObj*, %CObj*)* @bool_leq, %CObj* (%CObj*, %CObj*)* @bool_greater, %CObj* (%CObj*, %CObj*)* @bool_geq, %CObj* (%CObj*, %CObj*)* @bool_and, %CObj* (%CObj*, %CObj*)* @bool_or, %CObj* (%CObj*)* @bool_neg, %CObj* (%CObj*)* @bool_not, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* null }
@ctype_char = global %CType.0 { %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* @char_eq, %CObj* (%CObj*, %CObj*)* @char_neq, %CObj* (%CObj*, %CObj*)* @char_lesser, %CObj* (%CObj*, %CObj*)* @char_leq, %CObj* (%CObj*, %CObj*)* @char_greater, %CObj* (%CObj*, %CObj*)* @char_geq, %CObj* (%CObj*, %CObj*)* @char_and, %CObj* (%CObj*, %CObj*)* @char_or, %CObj* (%CObj*)* null, %CObj* (%CObj*)* @char_not, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj**)* null }
@ctype_list = global %CType.0 { %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*, %CObj*)* null, %CObj* (%CObj*)* null, %CObj* (%CObj*)* null, %CObj* (%CObj*, %CObj*)* @list_idx, %CObj* (%CObj*, %CObj**)* null }
@a = global %CObj* null
@l = global %CObj* null
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"

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
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %result_data = sub i32 0, %data
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall2 to i32*
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
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i32*
  %data = load i32, i32* %x4
  %result_data = xor i32 %data, -1
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall2 to i32*
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
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to double*
  %data = load double, double* %x4
  %result_data = fsub double -0.000000e+00, %data
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall2 to double*
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
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %result_data = sub i1 false, %data
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall2 to i1*
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
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %x4 = bitcast i8* %x3 to i1*
  %data = load i1, i1* %x4
  %result_data = xor i1 %data, true
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (i1* getelementptr (i1, i1* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall2 to i1*
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
  %self_p_p = alloca %CObj*
  store %CObj* %remote_self_p, %CObj** %self_p_p
  %self_p_p1 = load %CObj*, %CObj** %self_p_p
  %x2 = getelementptr inbounds %CObj, %CObj* %self_p_p1, i32 0, i32 0
  %x3 = load i8*, i8** %x2
  %data = load i8, i8* %x3
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
  %__gep_addr3 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 2
  %__capacity = load i32, i32* %__gep_addr3
  %__inbounds = icmp slt i32 %data, %__capacity
  %__gep_addr4 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr = bitcast i8** %__gep_addr4 to %CObj***
  %__gep_addr_as_cobjptrptr = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr
  %__gep_addr_as_cobjptrptr5 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr, i32 %data
  %__cobjptr = load %CObj*, %CObj** %__gep_addr_as_cobjptrptr5
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

declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %__new_dataptr = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_char, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %__new_dataptr, i8** %datafieldptr
  store i8 97, i8* %__new_dataptr
  %malloccall2 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr3 = bitcast i8* %malloccall2 to %CObj*
  %__new_dataptr5 = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr6 = getelementptr inbounds %CObj, %CObj* %__new_objptr3, i32 0, i32 1
  store %CType.0* @ctype_char, %CType.0** %ctypefieldptr6
  %datafieldptr7 = getelementptr inbounds %CObj, %CObj* %__new_objptr3, i32 0, i32 0
  store i8* %__new_dataptr5, i8** %datafieldptr7
  store i8 98, i8* %__new_dataptr5
  %malloccall8 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr9 = bitcast i8* %malloccall8 to %CObj*
  %__new_dataptr11 = tail call i8* @malloc(i32 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i32))
  %ctypefieldptr12 = getelementptr inbounds %CObj, %CObj* %__new_objptr9, i32 0, i32 1
  store %CType.0* @ctype_char, %CType.0** %ctypefieldptr12
  %datafieldptr13 = getelementptr inbounds %CObj, %CObj* %__new_objptr9, i32 0, i32 0
  store i8* %__new_dataptr11, i8** %datafieldptr13
  store i8 99, i8* %__new_dataptr11
  %malloccall14 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr15 = bitcast i8* %malloccall14 to %CObj*
  %malloccall16 = tail call i8* @malloc(i32 ptrtoint (%CList* getelementptr (%CList, %CList* null, i32 1) to i32))
  %__new_dataptr17 = bitcast i8* %malloccall16 to %CList*
  %dataptr_as_i8 = bitcast %CList* %__new_dataptr17 to i8*
  %ctypefieldptr18 = getelementptr inbounds %CObj, %CObj* %__new_objptr15, i32 0, i32 1
  store %CType.0* @ctype_list, %CType.0** %ctypefieldptr18
  %datafieldptr19 = getelementptr inbounds %CObj, %CObj* %__new_objptr15, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr19
  %malloccall20 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 10) to i32))
  %__new_dataptr21 = bitcast i8* %malloccall20 to [10 x %CObj*]*
  %dataptr_as_i822 = bitcast [10 x %CObj*]* %__new_dataptr21 to i8*
  %__elem_ptr = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr21, i32 0, i32 0
  store %CObj* %__new_objptr, %CObj** %__elem_ptr
  %__elem_ptr23 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr21, i32 0, i32 1
  store %CObj* %__new_objptr3, %CObj** %__elem_ptr23
  %__elem_ptr24 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr21, i32 0, i32 2
  store %CObj* %__new_objptr9, %CObj** %__elem_ptr24
  %__elem_ptr25 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr21, i32 0, i32 3
  store %CObj* null, %CObj** %__elem_ptr25
  %__elem_ptr26 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr21, i32 0, i32 4
  store %CObj* null, %CObj** %__elem_ptr26
  %__elem_ptr27 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr21, i32 0, i32 5
  store %CObj* null, %CObj** %__elem_ptr27
  %__elem_ptr28 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr21, i32 0, i32 6
  store %CObj* null, %CObj** %__elem_ptr28
  %__elem_ptr29 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr21, i32 0, i32 7
  store %CObj* null, %CObj** %__elem_ptr29
  %__elem_ptr30 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr21, i32 0, i32 8
  store %CObj* null, %CObj** %__elem_ptr30
  %__elem_ptr31 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr21, i32 0, i32 9
  store %CObj* null, %CObj** %__elem_ptr31
  %datafieldptr32 = getelementptr inbounds %CList, %CList* %__new_dataptr17, i32 0, i32 0
  store i8* %dataptr_as_i822, i8** %datafieldptr32
  %lenfieldptr = getelementptr inbounds %CList, %CList* %__new_dataptr17, i32 0, i32 1
  store i32 3, i32* %lenfieldptr
  %capfieldptr = getelementptr inbounds %CList, %CList* %__new_dataptr17, i32 0, i32 2
  store i32 10, i32* %capfieldptr
  store %CObj* %__new_objptr15, %CObj** @l
  %l = load %CObj*, %CObj** @l
  %malloccall33 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr34 = bitcast i8* %malloccall33 to %CObj*
  %malloccall35 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr36 = bitcast i8* %malloccall35 to i32*
  %dataptr_as_i837 = bitcast i32* %__new_dataptr36 to i8*
  %ctypefieldptr38 = getelementptr inbounds %CObj, %CObj* %__new_objptr34, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr38
  %datafieldptr39 = getelementptr inbounds %CObj, %CObj* %__new_objptr34, i32 0, i32 0
  store i8* %dataptr_as_i837, i8** %datafieldptr39
  store i32 1, i32* %__new_dataptr36
  %x2 = getelementptr inbounds %CObj, %CObj* %l, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %x4 = getelementptr inbounds %CType.0, %CType.0* %x3, i32 0, i32 15
  %fn_ptr = load %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)** %x4
  %binop_result = call %CObj* %fn_ptr(%CObj* %l, %CObj* %__new_objptr34)
  store %CObj* %binop_result, %CObj** @a
  %a = load %CObj*, %CObj** @a
  %x240 = getelementptr inbounds %CObj, %CObj* %a, i32 0, i32 0
  %x341 = load i8*, i8** %x240
  %x442 = bitcast i8* %x341 to i32*
  %data = load i32, i32* %x442
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %data)
  ret i32 0
}

