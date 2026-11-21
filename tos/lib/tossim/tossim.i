/*
 * Copyright (c) 2005 Stanford University. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the copyright holder nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * SWIG interface specification for TOSSIM. This file defines
 * the top-level TOSSIM and Mote objects which are exported to
 * Python. The typemap at the beginning allows a script to
 * use Python files as a parameter to a function that takes a
 * FILE* as a parameter (e.g., the logging system in sim_log.h).
 *
 * @author Philip Levis
 * @date   Nov 22 2005
 */

%module TOSSIM

%{
#if PY_MAJOR_VERSION >= 3
#define TOSSIM_STR_CHECK(o) PyUnicode_Check(o)
#define TOSSIM_STR_AS(o)    ((char*)PyUnicode_AsUTF8(o))
#define TOSSIM_INT_FROM_LONG(v) PyLong_FromLong(v)
#else
#define TOSSIM_STR_CHECK(o) PyString_Check(o)
#define TOSSIM_STR_AS(o)    PyString_AsString(o)
#define TOSSIM_INT_FROM_LONG(v) PyInt_FromLong(v)
#endif
%}

%{
#include <memory.h>
#include <tossim.h>

enum {
  PRIMITIVE_INTEGER      = 0,
  PRIMITIVE_FLOAT   = 1,
  PRIMITIVE_UNKNOWN = 2
};

int lengthOfType(char* type) {
  if (strcmp(type, "uint8_t") == 0) {
    return sizeof(uint8_t);
  }
  else if (strcmp(type, "uint16_t") == 0) {
    return sizeof(uint16_t);
  }
  else if (strcmp(type, "uint32_t") == 0) {
    return sizeof(uint32_t);
  }
  else if (strcmp(type, "int8_t") == 0) {
    return sizeof(int8_t);
  }
  else if (strcmp(type, "int16_t") == 0) {
    return sizeof(int16_t);
  }
  else if (strcmp(type, "int32_t") == 0) {
    return sizeof(int32_t);
  }
  else if (strcmp(type, "char") == 0) {
    return sizeof(char);
  }
  else if (strcmp(type, "short") == 0) {
    return sizeof(short);
  }
  else if (strcmp(type, "int") == 0) {
    return sizeof(int);
  }
  else if (strcmp(type, "long") == 0) {
    return sizeof(long);
  }
  else if (strcmp(type, "unsigned char") == 0) {
    return sizeof(unsigned char);
  }
  else if (strcmp(type, "unsigned short") == 0) {
    return sizeof(unsigned short);
  }
  else if (strcmp(type, "unsigned int") == 0) {
    return sizeof(unsigned int);
  }
  else if (strcmp(type, "unsigned long") == 0) {
    return sizeof(unsigned long);
  }
  else if (strcmp(type, "float") == 0) {
    return sizeof(float);
  }
  else if (strcmp(type, "double") == 0) {
    return sizeof(double);
  }
  else {
    return 1;
  }
}

int memoryToPrimitive(char* type, char* ptr, long* lval, double* dval) {
  if (strcmp(type, "uint8_t") == 0) {
    uint8_t val;
    memcpy(&val, ptr, sizeof(uint8_t));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "uint16_t") == 0) {
    uint16_t val;
    memcpy(&val, ptr, sizeof(uint16_t));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "uint32_t") == 0) {
    uint32_t val;
    memcpy(&val, ptr, sizeof(uint32_t));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "int8_t") == 0) {
    int8_t val;
    memcpy(&val, ptr, sizeof(int8_t));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "int16_t") == 0) {
    int16_t val;
    memcpy(&val, ptr, sizeof(int16_t));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "int32_t") == 0) {
    int32_t val;
    memcpy(&val, ptr, sizeof(int32_t));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "char") == 0) {
    long val;
    memcpy(&val, ptr, sizeof(char));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "short") == 0) {
    short val;
    memcpy(&val, ptr, sizeof(short));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "int") == 0) {
    int val;
    memcpy(&val, ptr, sizeof(int));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "long") == 0) {
    long val;
    memcpy(&val, ptr, sizeof(long));
    *lval = val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "unsigned char") == 0) {
    unsigned char val;
    memcpy(&val, ptr, sizeof(unsigned char));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "unsigned short") == 0) {
    unsigned short val;
    memcpy(&val, ptr, sizeof(unsigned short));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "unsigned int") == 0) {
    unsigned int val;
    memcpy(&val, ptr, sizeof(unsigned int));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "unsigned long") == 0) {
    unsigned long val;
    memcpy(&val, ptr, sizeof(unsigned long));
    *lval = (long)val;
    return PRIMITIVE_INTEGER;
  }
  else if (strcmp(type, "float") == 0) {
    float val;
    memcpy(&val, ptr, sizeof(float));
    *dval = (double)val;
    return PRIMITIVE_FLOAT;
  }
  else if (strcmp(type, "double") == 0) {
    double val;
    memcpy(&val, ptr, sizeof(double));
    *dval = val;
    return PRIMITIVE_FLOAT;
  }
  else {
    return PRIMITIVE_UNKNOWN;
  }
}

PyObject* valueFromScalar(char* type, char* ptr, int len) {
  long lval;
  double dval;
  int rval = memoryToPrimitive(type, ptr, &lval, &dval);
  switch(rval) {
    case PRIMITIVE_INTEGER:
      return TOSSIM_INT_FROM_LONG(lval);
    case PRIMITIVE_FLOAT:
      return PyFloat_FromDouble(dval);
    case PRIMITIVE_UNKNOWN:
    default:
      return PyBytes_FromStringAndSize(ptr, len);
  }
}

PyObject* listFromArray(char* type, char* ptr, int len) {
  long lval;
  double dval;
  int elementLen = lengthOfType(type);
  PyObject* list = PyList_New(0);
  //printf("Generating list of %s\n", type);
  for (char* tmpPtr = ptr; tmpPtr < ptr + len; tmpPtr += elementLen) {
    PyList_Append(list, valueFromScalar(type, tmpPtr, elementLen));    
  }
  return list;
}
%}


/* Packet payloads are binary: in Python 3 take bytes (str would be UTF-8 encoded, changing
   the length). Defined before packet.i, whose %apply copies it to (char *data, int len). */
%typemap(in) (char *STRING, int LENGTH) {
%#if PY_MAJOR_VERSION >= 3
  if (PyBytes_Check($input)) {
    $1 = PyBytes_AsString($input);
    $2 = (int)PyBytes_Size($input);
  }
  else if (PyByteArray_Check($input)) {
    $1 = PyByteArray_AsString($input);
    $2 = (int)PyByteArray_Size($input);
  }
  else {
    PyErr_SetString(PyExc_TypeError, "Requires bytes as a parameter.");
    SWIG_fail;
  }
%#else
  if (!PyString_Check($input)) {
    PyErr_SetString(PyExc_TypeError, "Requires a string as a parameter.");
    SWIG_fail;
  }
  $1 = PyString_AsString($input);
  $2 = (int)PyString_Size($input);
%#endif
}
/* The buffer belongs to the Python object: nothing to free. */
%typemap(freearg) (char *STRING, int LENGTH) "";

/* data() returns the payload, which is binary: in Python 3 give bytes of length(). Python 2
   keeps the original behaviour (a C string, cut at the first zero byte). */
%typemap(out) char* data {
%#if PY_MAJOR_VERSION >= 3
  $result = PyBytes_FromStringAndSize($1, arg1->length());
%#else
  if ($1) {
    $result = PyString_FromString($1);
  }
  else {
    Py_INCREF(Py_None);
    $result = Py_None;
  }
%#endif
}

%include mac.i
%include radio.i
%include packet.i

%typemap(in) FILE * {
%#if PY_MAJOR_VERSION >= 3
  /* Python 3 file objects have no FILE*: wrap a dup() of the descriptor, once per fd.
     sim_log drops duplicate outputs by fileno(), so a file added to several channels must
     keep one descriptor (and removeChannel needs the same FILE* that addChannel stored). */
  static FILE* tossim_fd_files[1024];
  int fd = PyObject_AsFileDescriptor($input);
  if (fd < 0 || fd >= 1024) {
    PyErr_SetString(PyExc_TypeError, "Requires a file as a parameter.");
    return NULL;
  }
  PyObject* flushed = PyObject_CallMethod($input, "flush", NULL);
  Py_XDECREF(flushed);
  PyErr_Clear();
  if (tossim_fd_files[fd] == NULL) {
    tossim_fd_files[fd] = fdopen(dup(fd), "a");
    setvbuf(tossim_fd_files[fd], NULL, _IOLBF, 0);
  }
  $1 = tossim_fd_files[fd];
%#else
  if (!PyFile_Check($input)) {
    PyErr_SetString(PyExc_TypeError, "Requires a file as a parameter.");
    return NULL;
  }
  $1 = PyFile_AsFile($input);
%#endif
}

%typemap(out) variable_string_t {
  if ($1.isArray) {
    //printf("Generating array %s\n", $1.type);
    $result = listFromArray  ($1.type, $1.ptr, $1.len);
  }
  else {
    //printf("Generating scalar %s\n", $1.type);
    $result = valueFromScalar($1.type, $1.ptr, $1.len);
  }
  if ($result == NULL) {
    PyErr_SetString(PyExc_RuntimeError, "Error generating Python type from TinyOS variable.");
  }
}


%typemap(in) nesc_app_t* {
  if (!PyList_Check($input)) {
    PyErr_SetString(PyExc_TypeError, "Requires a list as a parameter.");
    return NULL;
  }
  else {
    int size = PyList_Size($input);
    int i = 0;
    nesc_app_t* app;

    if (size % 3 != 0) {
      PyErr_SetString(PyExc_RuntimeError, "List must have 2*N elements.");
      return NULL;
    }

    app = (nesc_app_t*)malloc(sizeof(nesc_app_t));

    app->numVariables = size / 3;
    app->variableNames = (char**)malloc(sizeof(char*) * app->numVariables);
    app->variableTypes = (char**)malloc(sizeof(char*) * app->numVariables);
    app->variableArray = (int*)malloc(sizeof(int) * app->numVariables);

    memset(app->variableNames, 0, sizeof(char*) * app->numVariables);
    memset(app->variableTypes, 0, sizeof(char*) * app->numVariables);
    memset(app->variableArray, 0, sizeof(int) * app->numVariables);

    for (i = 0; i < app->numVariables; i++) {
      PyObject* name = PyList_GetItem($input, 3 * i);
      PyObject* array = PyList_GetItem($input, (3 * i) + 1);
      PyObject* format = PyList_GetItem($input, (3 * i) + 2);
      if (TOSSIM_STR_CHECK(name) && TOSSIM_STR_CHECK(format)) {
        app->variableNames[i] = TOSSIM_STR_AS(name);
        app->variableTypes[i] = TOSSIM_STR_AS(format);
        if (strcmp(TOSSIM_STR_AS(array), "array") == 0) {
          app->variableArray[i] = 1;
          //printf("%s is an array\n", TOSSIM_STR_AS(name));
        }
        else {
          app->variableArray[i] = 0;
          //printf("%s is a scalar\n", TOSSIM_STR_AS(name));
        }
      }
      else {
        app->variableNames[i] = (char*)"<bad string>";
        app->variableTypes[i] = (char*)"<bad string>";
      }
    }

    $1 = app;
  }
}

typedef struct variable_string {
  char* type;
  char* ptr;
  int len;
  int isArray;
} variable_string_t;

typedef struct nesc_app {
  int numVariables;
  char** variableNames;
  char** variableTypes;
  int* variableArray;
} nesc_app_t;

class Variable {
 public:
  Variable(char* name, char* format, int array, int mote);
  ~Variable();
  variable_string_t getData();  
};

class Mote {
 public:
  Mote(nesc_app_t* app);
  ~Mote();

  unsigned long id();
  
  long long int euid();
  void setEuid(long long int id);

  
  long long int bootTime();
  void bootAtTime(long long int time);

  bool isOn();
  void turnOff();
  void turnOn();
  Variable* getVariable(char* name);

  void addNoiseTraceReading(int val);
  void createNoiseModel();
  int generateNoise(int when);
};

class Tossim {
 public:
  Tossim(nesc_app_t* app);
  ~Tossim();
  
  void init();
  
  long long int time();
  long long int ticksPerSecond(); 
  void setTime(long long int time);
  char* timeStr();

  Mote* currentNode();
  Mote* getNode(unsigned long nodeID);
  void setCurrentNode(unsigned long nodeID);

  void addChannel(char* channel, FILE* file);
  bool removeChannel(char* channel, FILE* file);
  void randomSeed(int seed);

  bool runNextEvent();
  MAC* mac();
  Radio* radio();
  Packet* newPacket();
};


