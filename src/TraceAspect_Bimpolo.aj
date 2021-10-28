

public aspect TraceAspect_Bimpolo {
   pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
   pointcut methodToTrace():  classToTrace() &&  execution(public String getName());

   before(): methodToTrace() {
      String info = thisJoinPointStaticPart.getSignature() + ", " //
            + thisJoinPointStaticPart.getSourceLocation().getLine();
      System.out.println("\t-->" + info);
   }

   after(): methodToTrace() {
      System.out.println("\t<--" + thisJoinPointStaticPart.getSourceLocation().getFileName());
   }
}
