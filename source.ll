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
@a.1 = global %CObj* null
@foo = global %CObj* null
@i = global %CObj* null
@i.2 = global %CObj* null
@l = global %CObj* null
@l.3 = global %CObj* null
@x = global %CObj* null
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.4 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.6 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.7 = private unnamed_addr constant [4 x i8] c"%f\0A\00"

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
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall1 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 1, i32* %__new_dataptr
  %malloccall2 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr3 = bitcast i8* %malloccall2 to %CObj*
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr5 = bitcast i8* %malloccall4 to i32*
  %dataptr_as_i86 = bitcast i32* %__new_dataptr5 to i8*
  %ctypefieldptr7 = getelementptr inbounds %CObj, %CObj* %__new_objptr3, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr7
  %datafieldptr8 = getelementptr inbounds %CObj, %CObj* %__new_objptr3, i32 0, i32 0
  store i8* %dataptr_as_i86, i8** %datafieldptr8
  store i32 0, i32* %__new_dataptr5
  %malloccall9 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr10 = bitcast i8* %malloccall9 to %CObj*
  %malloccall11 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr12 = bitcast i8* %malloccall11 to i32*
  %dataptr_as_i813 = bitcast i32* %__new_dataptr12 to i8*
  %ctypefieldptr14 = getelementptr inbounds %CObj, %CObj* %__new_objptr10, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr14
  %datafieldptr15 = getelementptr inbounds %CObj, %CObj* %__new_objptr10, i32 0, i32 0
  store i8* %dataptr_as_i813, i8** %datafieldptr15
  store i32 5, i32* %__new_dataptr12
  %malloccall16 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr17 = bitcast i8* %malloccall16 to %CObj*
  %malloccall18 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr19 = bitcast i8* %malloccall18 to i32*
  %dataptr_as_i820 = bitcast i32* %__new_dataptr19 to i8*
  %ctypefieldptr21 = getelementptr inbounds %CObj, %CObj* %__new_objptr17, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr21
  %datafieldptr22 = getelementptr inbounds %CObj, %CObj* %__new_objptr17, i32 0, i32 0
  store i8* %dataptr_as_i820, i8** %datafieldptr22
  store i32 12, i32* %__new_dataptr19
  %malloccall23 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr24 = bitcast i8* %malloccall23 to %CObj*
  %malloccall25 = tail call i8* @malloc(i32 ptrtoint (%CList* getelementptr (%CList, %CList* null, i32 1) to i32))
  %__new_dataptr26 = bitcast i8* %malloccall25 to %CList*
  %dataptr_as_i827 = bitcast %CList* %__new_dataptr26 to i8*
  %ctypefieldptr28 = getelementptr inbounds %CObj, %CObj* %__new_objptr24, i32 0, i32 1
  store %CType.0* @ctype_list, %CType.0** %ctypefieldptr28
  %datafieldptr29 = getelementptr inbounds %CObj, %CObj* %__new_objptr24, i32 0, i32 0
  store i8* %dataptr_as_i827, i8** %datafieldptr29
  %malloccall30 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 10) to i32))
  %__new_dataptr31 = bitcast i8* %malloccall30 to [10 x %CObj*]*
  %dataptr_as_i832 = bitcast [10 x %CObj*]* %__new_dataptr31 to i8*
  %__elem_ptr = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr31, i32 0, i32 0
  store %CObj* %__new_objptr, %CObj** %__elem_ptr
  %__elem_ptr33 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr31, i32 0, i32 1
  store %CObj* %__new_objptr3, %CObj** %__elem_ptr33
  %__elem_ptr34 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr31, i32 0, i32 2
  store %CObj* %__new_objptr10, %CObj** %__elem_ptr34
  %__elem_ptr35 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr31, i32 0, i32 3
  store %CObj* %__new_objptr17, %CObj** %__elem_ptr35
  %__elem_ptr36 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr31, i32 0, i32 4
  store %CObj* null, %CObj** %__elem_ptr36
  %__elem_ptr37 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr31, i32 0, i32 5
  store %CObj* null, %CObj** %__elem_ptr37
  %__elem_ptr38 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr31, i32 0, i32 6
  store %CObj* null, %CObj** %__elem_ptr38
  %__elem_ptr39 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr31, i32 0, i32 7
  store %CObj* null, %CObj** %__elem_ptr39
  %__elem_ptr40 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr31, i32 0, i32 8
  store %CObj* null, %CObj** %__elem_ptr40
  %__elem_ptr41 = getelementptr [10 x %CObj*], [10 x %CObj*]* %__new_dataptr31, i32 0, i32 9
  store %CObj* null, %CObj** %__elem_ptr41
  %datafieldptr42 = getelementptr inbounds %CList, %CList* %__new_dataptr26, i32 0, i32 0
  store i8* %dataptr_as_i832, i8** %datafieldptr42
  %lenfieldptr = getelementptr inbounds %CList, %CList* %__new_dataptr26, i32 0, i32 1
  store i32 4, i32* %lenfieldptr
  %capfieldptr = getelementptr inbounds %CList, %CList* %__new_dataptr26, i32 0, i32 2
  store i32 10, i32* %capfieldptr
  store %CObj* %__new_objptr24, %CObj** @l.3
  %l = load %CObj*, %CObj** @l.3
  %malloccall43 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr44 = bitcast i8* %malloccall43 to %CObj*
  %malloccall45 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr46 = bitcast i8* %malloccall45 to i32*
  %dataptr_as_i847 = bitcast i32* %__new_dataptr46 to i8*
  %ctypefieldptr48 = getelementptr inbounds %CObj, %CObj* %__new_objptr44, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr48
  %datafieldptr49 = getelementptr inbounds %CObj, %CObj* %__new_objptr44, i32 0, i32 0
  store i8* %dataptr_as_i847, i8** %datafieldptr49
  store i32 2, i32* %__new_dataptr46
  %x2 = getelementptr inbounds %CObj, %CObj* %l, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %x4 = getelementptr inbounds %CType.0, %CType.0* %x3, i32 0, i32 15
  %fn_ptr = load %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)** %x4
  %binop_result = call %CObj* %fn_ptr(%CObj* %l, %CObj* %__new_objptr44)
  store %CObj* %binop_result, %CObj** @a.1
  %l50 = load %CObj*, %CObj** @l.3
  %__gep_addr = getelementptr inbounds %CObj, %CObj* %l50, i32 0, i32 0
  %__objptr = load i8*, i8** %__gep_addr
  %__clistptr = bitcast i8* %__objptr to %CList*
  %nptr = alloca i32
  store i32 0, i32* %nptr
  %n = load i32, i32* %nptr
  %__gep_addr51 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 1
  %__length = load i32, i32* %__gep_addr51
  br label %iter

iter:                                             ; preds = %for_body, %entry
  %n52 = load i32, i32* %nptr
  %nnext = add i32 %n52, 1
  store i32 %nnext, i32* %nptr
  %iter_complete = icmp sge i32 %n52, %__length
  br i1 %iter_complete, label %merge, label %for_body

for_body:                                         ; preds = %iter
  %__gep_addr53 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 2
  %__capacity = load i32, i32* %__gep_addr53
  %__inbounds = icmp slt i32 %n52, %__capacity
  %__gep_addr54 = getelementptr inbounds %CList, %CList* %__clistptr, i32 0, i32 0
  %__gep_addr_as_cobjptrptrptr = bitcast i8** %__gep_addr54 to %CObj***
  %__gep_addr_as_cobjptrptr = load %CObj**, %CObj*** %__gep_addr_as_cobjptrptrptr
  %__gep_addr_as_cobjptrptr55 = getelementptr %CObj*, %CObj** %__gep_addr_as_cobjptrptr, i32 %n52
  %__cobjptr = load %CObj*, %CObj** %__gep_addr_as_cobjptrptr55
  store %CObj* %__cobjptr, %CObj** @i.2
  %i = load %CObj*, %CObj** @i.2
  %x256 = getelementptr inbounds %CObj, %CObj* %i, i32 0, i32 0
  %x357 = load i8*, i8** %x256
  %x458 = bitcast i8* %x357 to i32*
  %data = load i32, i32* %x458
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %data)
  br label %iter

merge:                                            ; preds = %iter
  %a = load %CObj*, %CObj** @a.1
  %x259 = getelementptr inbounds %CObj, %CObj* %a, i32 0, i32 0
  %x360 = load i8*, i8** %x259
  %x461 = bitcast i8* %x360 to i32*
  %data62 = load i32, i32* %x461
  %printf63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %data62)
  %malloccall64 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr65 = bitcast i8* %malloccall64 to %CObj*
  %datafieldptr66 = getelementptr inbounds %CObj, %CObj* %__new_objptr65, i32 0, i32 0
  %ctypefieldptr67 = getelementptr inbounds %CObj, %CObj* %__new_objptr65, i32 0, i32 1
  %dfp_as_fp = bitcast i8** %datafieldptr66 to %CObj* (%CObj**)**
  store %CObj* (%CObj**)* @foo.5, %CObj* (%CObj**)** %dfp_as_fp
  store %CType.0* @ctype_func, %CType.0** %ctypefieldptr67
  store %CObj* %__new_objptr65, %CObj** @foo
  %malloccall68 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr69 = bitcast i8* %malloccall68 to %CObj*
  %malloccall70 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr71 = bitcast i8* %malloccall70 to i32*
  %dataptr_as_i872 = bitcast i32* %__new_dataptr71 to i8*
  %ctypefieldptr73 = getelementptr inbounds %CObj, %CObj* %__new_objptr69, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr73
  %datafieldptr74 = getelementptr inbounds %CObj, %CObj* %__new_objptr69, i32 0, i32 0
  store i8* %dataptr_as_i872, i8** %datafieldptr74
  store i32 5, i32* %__new_dataptr71
  store %CObj* %__new_objptr69, %CObj** @x
  %argv_arr = alloca [0 x %CObj*]
  %argv = bitcast [0 x %CObj*]* %argv_arr to %CObj**
  %foo = load %CObj*, %CObj** @foo
  %x275 = getelementptr inbounds %CObj, %CObj* %foo, i32 0, i32 1
  %x376 = load %CType.0*, %CType.0** %x275
  %x477 = getelementptr inbounds %CType.0, %CType.0* %x376, i32 0, i32 16
  %fn_ptr78 = load %CObj* (%CObj*, %CObj**)*, %CObj* (%CObj*, %CObj**)** %x477
  %result = call %CObj* %fn_ptr78(%CObj* %foo, %CObj** %argv)
  %x279 = getelementptr inbounds %CObj, %CObj* %result, i32 0, i32 0
  %x380 = load i8*, i8** %x279
  %x481 = bitcast i8* %x380 to i32*
  %data82 = load i32, i32* %x481
  %printf83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %data82)
  ret i32 0
}

define %CObj* @foo.5(%CObj**) {
entry:
  %formals_arr_p = bitcast %CObj** %0 to [0 x %CObj*]*
  %formals_arr = load [0 x %CObj*], [0 x %CObj*]* %formals_arr_p
  %x = load %CObj*, %CObj** @x
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr = bitcast i8* %malloccall to %CObj*
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr = bitcast i8* %malloccall1 to i32*
  %dataptr_as_i8 = bitcast i32* %__new_dataptr to i8*
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  store i32 3, i32* %__new_dataptr
  %x2 = getelementptr inbounds %CObj, %CObj* %x, i32 0, i32 1
  %x3 = load %CType.0*, %CType.0** %x2
  %x4 = getelementptr inbounds %CType.0, %CType.0* %x3, i32 0, i32 5
  %fn_ptr = load %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)** %x4
  %binop_result = call %CObj* %fn_ptr(%CObj* %x, %CObj* %__new_objptr)
  %x22 = getelementptr inbounds %CObj, %CObj* %binop_result, i32 0, i32 0
  %x33 = load i8*, i8** %x22
  %x44 = bitcast i8* %x33 to i1*
  %data = load i1, i1* %x44
  br i1 %data, label %then, label %else

merge:                                            ; No predecessors!
  %malloccall13 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr14 = bitcast i8* %malloccall13 to %CObj*
  %malloccall15 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr16 = bitcast i8* %malloccall15 to i32*
  %dataptr_as_i817 = bitcast i32* %__new_dataptr16 to i8*
  %ctypefieldptr18 = getelementptr inbounds %CObj, %CObj* %__new_objptr14, i32 0, i32 1
  store %CType.0* @ctype_int, %CType.0** %ctypefieldptr18
  %datafieldptr19 = getelementptr inbounds %CObj, %CObj* %__new_objptr14, i32 0, i32 0
  store i8* %dataptr_as_i817, i8** %datafieldptr19
  store i32 69, i32* %__new_dataptr16
  ret %CObj* %__new_objptr14

then:                                             ; preds = %entry
  %x5 = load %CObj*, %CObj** @x
  ret %CObj* %x5

else:                                             ; preds = %entry
  %malloccall6 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr7 = bitcast i8* %malloccall6 to %CObj*
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %__new_dataptr9 = bitcast i8* %malloccall8 to double*
  %dataptr_as_i810 = bitcast double* %__new_dataptr9 to i8*
  %ctypefieldptr11 = getelementptr inbounds %CObj, %CObj* %__new_objptr7, i32 0, i32 1
  store %CType.0* @ctype_float, %CType.0** %ctypefieldptr11
  %datafieldptr12 = getelementptr inbounds %CObj, %CObj* %__new_objptr7, i32 0, i32 0
  store i8* %dataptr_as_i810, i8** %datafieldptr12
  store double 4.000000e+00, double* %__new_dataptr9
  ret %CObj* %__new_objptr7
}

