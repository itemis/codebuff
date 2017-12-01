package org.antlr.codebuff;

public class LengthFeatureMetadata extends FeatureMetaData {
  public LengthFeatureMetadata(String[] abbrevHeaderRows) {
    super(FeatureType.INT, abbrevHeaderRows, 1);
  }

  @Override
  public double mismatchCost(int left, int right) {
    return mismatchCost * Math.abs(left - right);
  }

  public static int logicalLength(String text) {
    int len = text.length();
    if (len <= 2) {
      return 0;
    }
    if (len <= 4) {
      return 1;
    }
    if (len <= 6) {
      return 2;
    }
    if (len <= 10) {
      return 4;
    }
    if (len <= 15) {
      return 6;
    }
    return 8;
  }
}
