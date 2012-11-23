package org.sugarj;

import static org.sugarj.common.ATermCommands.getApplicationSubterm;
import static org.sugarj.common.ATermCommands.isApplication;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.eclipse.core.runtime.FileLocator;
import org.spoofax.interpreter.terms.IStrategoTerm;
import org.sugarj.common.ATermCommands;
import org.sugarj.common.Environment;
import org.sugarj.common.FileCommands;
import org.sugarj.common.IErrorLogger;
import org.sugarj.common.path.Path;
import org.sugarj.common.path.RelativePath;
import org.sugarj.common.path.RelativeSourceLocationPath;
import org.sugarj.fomegamodulesystemtest.FomegaMstSourceFileContent;
import org.sugarj.languagelib.SourceFileContent;
import org.sugarj.languagelib.SourceImport;

/**
 * @author Florian Lorenzen <florian.lorenzen at tu-berlin de>
 */
public class FomegaMstLib extends LanguageLib {

  private static final long serialVersionUID = 6325786656556068937L;

  private transient File libDir;
  
  private FomegaMstSourceFileContent sourceContent;
  private Set<RelativePath> generatedModules = new HashSet<RelativePath>();
  
  private String relNamespaceName;
  private Path outFile;
  private String moduleName;

  private IStrategoTerm ppTable;

  public String getVersion() {
    return "fomega-0.1c";
  }
  
  @Override
  public String getLanguageName() {
    return "FomegaModuleSystemTest";
  }

  @Override
  public List<File> getGrammars() {
    List<File> grammars = new LinkedList<File>(super.getGrammars());
    grammars.add(ensureFile("org/sugarj/languages/SugarFomegaMst.def"));
    grammars.add(ensureFile("org/sugarj/languages/FomegaMst.def"));
    return Collections.unmodifiableList(grammars);
  }
  
  @Override
  public File getInitGrammar() {
    return ensureFile("org/sugarj/fomegamodulesystemtest/initGrammar.sdf");
  }

  @Override
  public String getInitGrammarModule() {
    return "org/sugarj/fomegamodulesystemtest/initGrammar";
  }

  @Override
  public File getInitTrans() {
    return ensureFile("org/sugarj/fomegamodulesystemtest/initTrans.str");
  }

  @Override
  public String getInitTransModule() {
    return "org/sugarj/fomegamoduleystemtest/initTrans";
  }

  @Override
  public File getInitEditor() {
    return ensureFile("org/sugarj/fomegamodulesystemtest/initEditor.serv");
  }

  @Override
  public String getInitEditorModule() {
    return "org/sugarj/fomegamodulesystemtest/initEditor";
  }

  @Override
  public File getLibraryDirectory() {
    if (libDir == null) { // set up directories first
      String thisClassPath = "org/sugarj/FomegaMstLib.class";
      URL thisClassURL = FomegaMstLib.class.getClassLoader().getResource(thisClassPath);
      
      if (thisClassURL.getProtocol().equals("bundleresource"))
        try {
          thisClassURL = FileLocator.resolve(thisClassURL);
        } catch (IOException e) {
          e.printStackTrace();
        }
      
      String classPath = thisClassURL.getPath();
      String binPath = classPath.substring(0, classPath.length() - thisClassPath.length());
      
      libDir = new File(binPath);
    }
    
    return libDir;
  }

  @Override
  public String getGeneratedFileExtension() {
    return "pts";
  }

  @Override
  public String getSugarFileExtension() {
    return "sf2";
  }

  @Override
  public SourceFileContent getSource() {
    return sourceContent;
  }

  @Override
  public Path getOutFile() {
    return outFile;
  }

  @Override
  public Set<RelativePath> getGeneratedFiles() {
    return generatedModules;
  }
  
  @Override
  public String getRelativeNamespace() {
    return relNamespaceName;
  }

  @Override
  public boolean isNamespaceDec(IStrategoTerm decl) {
    return isApplication(decl, "ModuleDec");
  }

  @Override
  public boolean isLanguageSpecificDec(IStrategoTerm decl) {
    return isApplication(decl, "FomegaBody");
  }

  @Override
  public boolean isSugarDec(IStrategoTerm decl) {
    if (isApplication(decl, "SugarBody")) {
      sourceContent.setHasNonfomegaDecl(true);
      return true;
    }
    return false;
  }

  @Override
  public boolean isEditorServiceDec(IStrategoTerm decl) {
    if (isApplication(decl, "EditorBody")) {   
      sourceContent.setHasNonfomegaDecl(true);
      return true;
    }
    return false;
  }

  @Override
  public boolean isImportDec(IStrategoTerm decl) {
    return isApplication(decl, "Import");
  }

  @Override
  public boolean isPlainDec(IStrategoTerm decl) {
    if (isApplication(decl, "PlainDec")) {   
      sourceContent.setHasNonfomegaDecl(true);
      return true;
    }
    return false;
  }
  
  @Override
  public LanguageLibFactory getFactoryForLanguage() {
    return FomegaMstLibFactory.getInstance();
  }


  
  /*
   * processing stuff follows here
   */
  
  @Override
  public void setupSourceFile(RelativePath sourceFile, Environment environment) {
    outFile = environment.createBinPath(FileCommands.dropExtension(sourceFile.getRelativePath()) + ".pts-source");
    sourceContent = new FomegaMstSourceFileContent();
  }

  @Override
  public void processNamespaceDec(IStrategoTerm toplevelDecl, Environment environment, IErrorLogger errorLog, RelativeSourceLocationPath sourceFile, RelativeSourceLocationPath sourceFileFromResult) throws IOException {
    String qualifiedModuleName = prettyPrint(getApplicationSubterm(toplevelDecl, "ModuleDec", 0));
    String qualifiedModulePath = qualifiedModuleName.replace('.', '/');
    String declaredModuleName = FileCommands.fileName(qualifiedModulePath);
    moduleName = FileCommands.dropExtension(FileCommands.fileName(sourceFile.getRelativePath()));
    String declaredRelNamespaceName = FileCommands.dropFilename(qualifiedModulePath);
    relNamespaceName = FileCommands.dropFilename(sourceFile.getRelativePath());
    
    RelativePath objectFile = environment.createBinPath(getRelativeNamespaceSep() + moduleName + "." + getGeneratedFileExtension());
    generatedModules.add(objectFile);
    
    //sourceContent.setNamespaceDecl(prettyPrint(toplevelDecl));
    sourceContent.setNamespaceDecl("");   // lexical imports: source content doesn't have a namespace decl
    
    if (!declaredRelNamespaceName.equals(relNamespaceName))
      setErrorMessage(toplevelDecl,
                      "The declared namespace '" + declaredRelNamespaceName + "'" +
                      " does not match the expected namespace '" + relNamespaceName + "'.", errorLog);
    
    if (!declaredModuleName.equals(moduleName))
      setErrorMessage(toplevelDecl,
                      "The declared module name '" + declaredModuleName + "'" +
                      " does not match the expected module name '" + moduleName + "'.", errorLog);
  }

  @Override
  public void processLanguageSpecific(IStrategoTerm toplevelDecl, Environment environment) throws IOException {
//    IStrategoTerm term = getApplicationSubterm(toplevelDecl, "FomegaBody", 0);
    String text = null;
    try {
      text = prettyPrint(toplevelDecl);
    } catch (NullPointerException e) {
      ATermCommands.setErrorMessage(toplevelDecl, "pretty printing Fomega failed");
    }
    if (text != null)
      sourceContent.addBodyDecl(text);
  }

  @Override
  public String getImportedModulePath(IStrategoTerm toplevelDecl) throws IOException {
    return prettyPrint(getApplicationSubterm(toplevelDecl, "Import", 1)).replace('.', '/');
  }
  
  @Override
  public void addImportModule(IStrategoTerm toplevelDecl, boolean checked) throws IOException {
    SourceImport imp = new SourceImport(getImportedModulePath(toplevelDecl), prettyPrint(toplevelDecl));
    if (checked)
      sourceContent.addCheckedImport(imp);
    else
      sourceContent.addImport(imp);
  }
  
  @Override
  public String getSugarName(IStrategoTerm decl) throws IOException {
    return moduleName;
  }

  @Override
  public IStrategoTerm getSugarBody(IStrategoTerm decl) {
    return getApplicationSubterm(decl, "SugarBody", 0);
  }

  @Override
  public String prettyPrint(IStrategoTerm term) throws IOException {
    if (ppTable == null) 
      ppTable = ATermCommands.readPrettyPrintTable(ensureFile("org/sugarj/languages/Fomega.pp").getAbsolutePath());
    
    return ATermCommands.prettyPrint(ppTable, term, interp);
  }
  
  @Override
  protected void compile(List<Path> outFiles, Path bin, List<Path> includePaths, boolean generateFiles) throws IOException {
    if (generateFiles) {
      for (Path out : outFiles) {
        RelativePath relOut = (RelativePath) out;
        Path compilePath = new RelativePath(bin, FileCommands.dropExtension(relOut.getRelativePath()) + ".pts");
        FileCommands.copyFile(out, compilePath);
      }
    }
  }

  @Override
  public boolean isModuleResolvable(String relModulePath) {
    return false;
  }

  @Override
  public String getEditorName(IStrategoTerm decl) throws IOException {
    return moduleName;
  }

  @Override
  public IStrategoTerm getEditorServices(IStrategoTerm decl) {
    return getApplicationSubterm(decl, "EditorBody", 0);
  }
}