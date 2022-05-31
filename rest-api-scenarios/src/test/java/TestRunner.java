import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import cucumber.api.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@CucumberOptions(tags = {"@V5"})

public class TestRunner {
    @Test
    public void testParallel() {
        String karateOutputPath = "target/cucumber-html-reports"; //do not change this path unless you change it on jenkins job, refer to DB for more details
        Results stats = Runner.parallel(getClass(), 1, karateOutputPath);
        generateReport(karateOutputPath);
        Assert.assertEquals("there are scenario failures", 0, stats.getFailCount());
    }

    private static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        for (File file : jsonFiles) {
            jsonPaths.add(file.getAbsolutePath());
        }
        Configuration config = new Configuration(new File("target"), "YOUR PROJECT NAME");
        config.addClassifications("Environment", System.getProperty("karate.env"));
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}
