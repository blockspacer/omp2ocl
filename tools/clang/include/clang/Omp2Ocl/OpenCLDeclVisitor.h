#ifndef __OPENCLDECLVISITOR_H__
#define __OPENCLDECLVISITOR_H__

#include "clang/AST/ASTContext.h"
#include "clang/AST/DeclVisitor.h"
#include "clang/AST/Decl.h"
#include "clang/AST/DeclCXX.h"
#include "clang/AST/DeclObjC.h"
#include "clang/AST/Expr.h"
#include "clang/AST/ExprCXX.h"
#include "clang/AST/PrettyPrinter.h"
#include "llvm/Support/raw_ostream.h"
#include <string>
#include <iostream>

using namespace std;
using namespace clang;

namespace clang{
	class OpenCLDeclVisitor : public DeclVisitor<OpenCLDeclVisitor> {
		llvm::raw_ostream &Out;
		ASTContext &Context;
		PrintingPolicy Policy;
		unsigned Indentation;

		llvm::raw_ostream& Indent() { return Indent(Indentation); }
		llvm::raw_ostream& Indent(unsigned Indentation);
		void ProcessDeclGroup(llvm::SmallVectorImpl<Decl*>& Decls);
		void Print(AccessSpecifier AS);

		vector<string> headerFiles;
		string currentFile;

		public:
		static vector<FunctionDecl*> functions;
		OpenCLDeclVisitor(llvm::raw_ostream &Out, ASTContext &Context,
				const PrintingPolicy &Policy,
				unsigned Indentation, string cf)
			: Out(Out), Context(Context), Policy(Policy), Indentation(Indentation), currentFile(cf){ 
			}


		~OpenCLDeclVisitor()
		{
		}

		bool isInHeaderFiles(string& file)
		{
			for (vector<string>::iterator iter = headerFiles.begin(); iter != headerFiles.end(); iter++)
			{
				if ((*iter) == file)
					return true;
			}

			return false;
		}

		vector<string>& getHeaderFiles()
		{
			return headerFiles;
		}

		bool isCurrentFile(SourceLocation loc);
		void add2HeadFileList(SourceLocation loc);
		void VisitDeclContext(DeclContext *DC, bool Indent = true);
		void VisitTranslationUnitDecl(TranslationUnitDecl *D);
		void VisitTypedefDecl(TypedefDecl *D);
		void VisitEnumDecl(EnumDecl *D);
		void VisitRecordDecl(RecordDecl *D);
		void VisitEnumConstantDecl(EnumConstantDecl *D);
		void VisitFunctionDecl(FunctionDecl *D);
		void VisitFieldDecl(FieldDecl *D);
		void VisitVarDecl(VarDecl *D);
		void VisitLabelDecl(LabelDecl *D);
		void VisitParmVarDecl(ParmVarDecl *D);
		void VisitFileScopeAsmDecl(FileScopeAsmDecl *D);
		void VisitStaticAssertDecl(StaticAssertDecl *D);
		void VisitNamespaceDecl(NamespaceDecl *D);
		void VisitUsingDirectiveDecl(UsingDirectiveDecl *D);
		void VisitNamespaceAliasDecl(NamespaceAliasDecl *D);
		void VisitCXXRecordDecl(CXXRecordDecl *D);
		void VisitLinkageSpecDecl(LinkageSpecDecl *D);
		void VisitTemplateDecl(TemplateDecl *D);
		void VisitObjCMethodDecl(ObjCMethodDecl *D);
		void VisitObjCClassDecl(ObjCClassDecl *D);
		void VisitObjCImplementationDecl(ObjCImplementationDecl *D);
		void VisitObjCInterfaceDecl(ObjCInterfaceDecl *D);
		void VisitObjCForwardProtocolDecl(ObjCForwardProtocolDecl *D);
		void VisitObjCProtocolDecl(ObjCProtocolDecl *D);
		void VisitObjCCategoryImplDecl(ObjCCategoryImplDecl *D);
		void VisitObjCCategoryDecl(ObjCCategoryDecl *D);
		void VisitObjCCompatibleAliasDecl(ObjCCompatibleAliasDecl *D);
		void VisitObjCPropertyDecl(ObjCPropertyDecl *D);
		void VisitObjCPropertyImplDecl(ObjCPropertyImplDecl *D);
		void VisitUnresolvedUsingTypenameDecl(UnresolvedUsingTypenameDecl *D);
		void VisitUnresolvedUsingValueDecl(UnresolvedUsingValueDecl *D);
		void VisitUsingDecl(UsingDecl *D);
		void VisitUsingShadowDecl(UsingShadowDecl *D);
		void addFunction(FunctionDecl* decl);
	};

}

#endif
