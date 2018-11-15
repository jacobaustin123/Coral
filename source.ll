; ModuleID = 'MicroC'
source_filename = "MicroC"

%CType = type { %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)* }
%CObj = type { i8*, %CType* }

@ctype_int = global %CType { %CObj* (%CObj*, %CObj*)* @int_add, %CObj* (%CObj*, %CObj*)* @int_sub, %CObj* (%CObj*, %CObj*)* @int_neq, %CObj* (%CObj*, %CObj*)* @int_greater }
@ctype_bool = global %CType zeroinitializer
@a = global %CObj* null
@b = global %CObj* null
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
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType* @ctype_int, %CType** %ctypefieldptr
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
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType* @ctype_int, %CType** %ctypefieldptr
  store i32 %result_data, i32* %__new_dataptr
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
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType* @ctype_int, %CType** %ctypefieldptr
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
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType* @ctype_int, %CType** %ctypefieldptr
  store i1 %result_data, i1* %__new_dataptr
  ret %CObj* %__new_objptr
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
  %datafieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 0
  store i8* %dataptr_as_i8, i8** %datafieldptr
  %ctypefieldptr = getelementptr inbounds %CObj, %CObj* %__new_objptr, i32 0, i32 1
  store %CType* @ctype_int, %CType** %ctypefieldptr
  store i32 1234342213, i32* %__new_dataptr
  store %CObj* %__new_objptr, %CObj** @a
  %malloccall2 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %__new_objptr3 = bitcast i8* %malloccall2 to %CObj*
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %__new_dataptr5 = bitcast i8* %malloccall4 to i32*
  %dataptr_as_i86 = bitcast i32* %__new_dataptr5 to i8*
  %datafieldptr7 = getelementptr inbounds %CObj, %CObj* %__new_objptr3, i32 0, i32 0
  store i8* %dataptr_as_i86, i8** %datafieldptr7
  %ctypefieldptr8 = getelementptr inbounds %CObj, %CObj* %__new_objptr3, i32 0, i32 1
  store %CType* @ctype_int, %CType** %ctypefieldptr8
  store i32 3342321, i32* %__new_dataptr5
  store %CObj* %__new_objptr3, %CObj** @b
  br label %while

while:                                            ; preds = %merge, %entry
  %a26 = load %CObj*, %CObj** @a
  %b27 = load %CObj*, %CObj** @b
  %x228 = getelementptr inbounds %CObj, %CObj* %a26, i32 0, i32 1
  %x329 = load %CType*, %CType** %x228
  %x430 = getelementptr inbounds %CType, %CType* %x329, i32 0, i32 2
  %fn_ptr31 = load %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)** %x430
  %binop_result32 = call %CObj* %fn_ptr31(%CObj* %a26, %CObj* %b27)
  %x233 = getelementptr inbounds %CObj, %CObj* %binop_result32, i32 0, i32 0
  %x334 = load i8*, i8** %x233
  %x435 = bitcast i8* %x334 to i1*
  %data36 = load i1, i1* %x435
  br i1 %data36, label %while_body, label %merge37

while_body:                                       ; preds = %while
  %a = load %CObj*, %CObj** @a
  %b = load %CObj*, %CObj** @b
  %x2 = getelementptr inbounds %CObj, %CObj* %a, i32 0, i32 1
  %x3 = load %CType*, %CType** %x2
  %x4 = getelementptr inbounds %CType, %CType* %x3, i32 0, i32 3
  %fn_ptr = load %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)** %x4
  %binop_result = call %CObj* %fn_ptr(%CObj* %a, %CObj* %b)
  %x29 = getelementptr inbounds %CObj, %CObj* %binop_result, i32 0, i32 0
  %x310 = load i8*, i8** %x29
  %x411 = bitcast i8* %x310 to i1*
  %data = load i1, i1* %x411
  br i1 %data, label %then, label %else

merge:                                            ; preds = %else, %then
  br label %while

then:                                             ; preds = %while_body
  %a12 = load %CObj*, %CObj** @a
  %b13 = load %CObj*, %CObj** @b
  %x214 = getelementptr inbounds %CObj, %CObj* %a12, i32 0, i32 1
  %x315 = load %CType*, %CType** %x214
  %x416 = getelementptr inbounds %CType, %CType* %x315, i32 0, i32 1
  %fn_ptr17 = load %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)** %x416
  %binop_result18 = call %CObj* %fn_ptr17(%CObj* %a12, %CObj* %b13)
  store %CObj* %binop_result18, %CObj** @a
  br label %merge

else:                                             ; preds = %while_body
  %b19 = load %CObj*, %CObj** @b
  %a20 = load %CObj*, %CObj** @a
  %x221 = getelementptr inbounds %CObj, %CObj* %b19, i32 0, i32 1
  %x322 = load %CType*, %CType** %x221
  %x423 = getelementptr inbounds %CType, %CType* %x322, i32 0, i32 1
  %fn_ptr24 = load %CObj* (%CObj*, %CObj*)*, %CObj* (%CObj*, %CObj*)** %x423
  %binop_result25 = call %CObj* %fn_ptr24(%CObj* %b19, %CObj* %a20)
  store %CObj* %binop_result25, %CObj** @b
  br label %merge

merge37:                                          ; preds = %while
  %a38 = load %CObj*, %CObj** @a
  %x239 = getelementptr inbounds %CObj, %CObj* %a38, i32 0, i32 0
  %x340 = load i8*, i8** %x239
  %x441 = bitcast i8* %x340 to i32*
  %data42 = load i32, i32* %x441
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %data42)
  ret i32 0
}
