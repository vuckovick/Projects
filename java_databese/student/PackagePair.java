package student;

import java.math.BigDecimal;
import rs.etf.sab.operations.PackageOperations.Pair;

public class PackagePair implements Pair<Integer, BigDecimal> {
    private Integer offerId;
    private BigDecimal percentage;

    public PackagePair(int offerId, BigDecimal percentage) {
        this.offerId = offerId;
        this.percentage = percentage;
    }

    @Override
    public Integer getFirstParam() {
        return offerId;
    }

    @Override
    public BigDecimal getSecondParam() {
        return percentage;
    }
}